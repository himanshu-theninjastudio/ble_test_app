import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:crclib/catalog.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class UploadUtils {
  UploadUtils();

  Future<void> updateFirmware({
    required BluetoothCharacteristic characteristic,
    required void Function() onSuccess,
    required void Function(double) onProgress,
    required void Function(int code) onError,
    required File firmwareFile,
    required int mtu,
  }) async {
    int payloadSize = mtu - 10;
    StreamSubscription<List<int>>? ackStream;
    Uint8List firmwareBytes = await firmwareFile.readAsBytes();
    int totalSectors = (firmwareBytes.length / 4096).ceil();

    int sectorAckIndex = 0;

    // Listen for ACKs
    ackStream = characteristic.onValueReceived.listen((data) async {
      if (data.isEmpty) return;
      await getSectorAck(
        data: Uint8List.fromList(data),
        expectedIndex: sectorAckIndex,
        onSuccess: () async {
          log("✅ Ack Data: ${data.toList()}");
          final progress = (sectorAckIndex) / totalSectors * 100;
          onProgress.call(progress);
          sectorAckIndex++;
          if (sectorAckIndex < totalSectors) {
            await sendSector(
              firmware: firmwareBytes,
              sectorIndex: sectorAckIndex,
              characteristic: characteristic,
              payloadSize: payloadSize,
              maxRetries: 3,
            );
          } else {
            log("🎉 OTA Complete");
            onSuccess.call();
            await ackStream?.cancel();
            await characteristic.setNotifyValue(false);
          }
        },
        onRetry: () async {
          log("🔄 Retrying sector $sectorAckIndex");
          await sendSector(
            firmware: firmwareBytes,
            sectorIndex: sectorAckIndex,
            characteristic: characteristic,
            payloadSize: payloadSize,
            maxRetries: 3,
          );
        },
        onError: (code) async {
          log("❌ OTA Error $code");
          onError.call(code);
          await ackStream?.cancel();
          await characteristic.setNotifyValue(false);
        },
      );
    });

    // Enable notifications
    characteristic.setNotifyValue(true);

    // Start with sector 0
    
    sendSector(
      firmware: firmwareBytes,
      sectorIndex: sectorAckIndex,
      characteristic: characteristic,
      payloadSize: payloadSize,
      maxRetries: 3,
    );
  }

  Future<void> sendSector({
    required Uint8List firmware,
    required int sectorIndex,
    required int payloadSize,
    required int maxRetries,
    required BluetoothCharacteristic characteristic,
  }) async {
    const int sectorSize = 4096;
    int start = sectorIndex * sectorSize;
    int end =
        (start + sectorSize > firmware.length)
            ? firmware.length
            : start + sectorSize;

    Uint8List sectorData = firmware.sublist(start, end);
    // Compute CRC16 of this sector (actual length)
    final crc = Crc16CcittFalse().convert(sectorData).toBigInt().toInt();

    int retries = 0;

    while (retries <= maxRetries) {
      try {
        int offset = 0;
        int sequence = 0;

        while (offset < sectorData.length) {
          int chunkEnd =
              (offset + payloadSize > sectorData.length)
                  ? sectorData.length
                  : offset + payloadSize;
          Uint8List chunk = sectorData.sublist(offset, chunkEnd);
          offset = chunkEnd;

          bool isLast = offset >= sectorData.length;

          final packet = BytesBuilder();

          // Sector index (2B LE)
          packet.addByte(sectorIndex & 0xFF);
          packet.addByte((sectorIndex >> 8) & 0xFF);

          if (isLast) {
            // Last packet
            packet.addByte(0xFF);
            packet.add(chunk);

            // Append CRC16
            packet.addByte(crc & 0xFF);
            packet.addByte((crc >> 8) & 0xFF);
            log("📦 Packet (Last) ${packet.toBytes()}");
          } else {
            // Normal packet
            packet.addByte(sequence & 0xFF);
            packet.add(chunk);
          }

          // Send to ESP OTA characteristic
          characteristic.write(packet.toBytes(), withoutResponse: false);

          sequence++;
        }
        // success, exit retry loop
        return;
      } catch (e) {
        retries++;
        if (retries > maxRetries) {
          throw Exception(
            "Sector $sectorIndex failed after $maxRetries retries",
          );
        }
        log("Retry $retries for sector $sectorIndex...");
        await Future.delayed(Duration(milliseconds: 100));
      }
    }
  }

  Future<void> getSectorAck({
    required Uint8List data,
    required int expectedIndex,
    required VoidCallback onSuccess,
    required Future<void> Function() onRetry,
    required void Function(int code) onError,
  }) async {
    try {
      final ackIndex = (data[0] & 0xFF) | ((data[1] & 0xFF) << 8);
      final ackStatus = (data[2] & 0xFF) | ((data[3] & 0xFF) << 8);

      if (ackIndex != expectedIndex) {
        log("ACK index mismatch → got $ackIndex, expected $expectedIndex");
        onError(1);
        return;
      }

      switch (ackStatus) {
        case 0x0000:
          onSuccess();
          break;

        case 0x0001:
          await onRetry();
          break;

        case 0x0002:
          onError(2);
          break;

        case 0x0003:
          onError(3);
          break;

        default:
          onError(-1);
      }
    } catch (e) {
      log("ACK parse error: $e");
      onError(-1);
    }
  }

  Future<void> postCommandStart({
    required BluetoothCharacteristic characteristic,
    required Uint8List firmwareBytes,
    void Function()? onAckReceived,
  }) async {
    final binSize = firmwareBytes.length;
    final payload =
        Uint8List(4)
          ..[0] = binSize & 0xFF
          ..[1] = (binSize >> 8) & 0xFF
          ..[2] = (binSize >> 16) & 0xFF
          ..[3] = (binSize >> 24) & 0xFF;

    final packet = genCommandPacket(0x0001, payload);

    characteristic.onValueReceived.listen((data) async {
      if (data.isEmpty) return;
      final ackStatus = (data[4] & 0xFF) | ((data[5] & 0xFF) << 8);
      log("Start OTA acknowledgment received: $ackStatus");
      if (ackStatus == 0x0000) {
        onAckReceived?.call();
        await characteristic.setNotifyValue(false);
        return;
      }
    });
    characteristic.setNotifyValue(true);
    characteristic.write(packet, withoutResponse: false);
  }

  Future<void> postCommandEnd({
    required BluetoothCharacteristic characteristic,
  }) async {
    final payload = Uint8List(0);
    final packet = genCommandPacket(0x0002, payload);
    characteristic.write(packet, withoutResponse: false);
  }

  Uint8List genCommandPacket(int id, Uint8List payload) {
    final packet = Uint8List(20);

    // Command ID (2B LE)
    packet[0] = id & 0xFF;
    packet[1] = (id >> 8) & 0xFF;

    // Copy payload (max 16 bytes)
    final truncated = (payload.length > 16) ? payload.sublist(0, 16) : payload;
    packet.setRange(2, 2 + truncated.length, truncated);

    // Compute CRC16 over first 18 bytes
    final crc =
        Crc16CcittFalse().convert(packet.sublist(0, 18)).toBigInt().toInt();
    packet[18] = crc & 0xFF;
    packet[19] = (crc >> 8) & 0xFF;

    return packet;
  }
}
