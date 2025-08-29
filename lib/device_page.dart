import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:ble_test/constants/key_const.dart';
import 'package:ble_test/utils/upload_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key, required this.device});

  final BluetoothDevice device;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  List<BluetoothCharacteristic> characteristics = [];
  final UploadUtils _uploadUtils = UploadUtils();
  File? selectedFile;
  String? selectedFileName;

  Future<void> discoverServices() async {
    if (Platform.isAndroid) {
      await widget.device.requestMtu(517);
      await widget.device.requestConnectionPriority(
        connectionPriorityRequest: ConnectionPriority.high,
      );
    }

    log('MTU: ${await widget.device.mtu.first}');
    List<BluetoothService> services = await widget.device.discoverServices();
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        characteristics.add(characteristic);
      }
    }

    setState(() {});
  }

  void startOTA() async {
    if (selectedFile == null) {
      log('Please select a firmware file first.');
      return;
    }
    BluetoothCharacteristic? startCharacteristic;
    BluetoothCharacteristic? stopCharacteristic;
    BluetoothCharacteristic? uploadCharacteristic;

    // Fetch OTA characteristics
    for (final characteristic in characteristics) {
      if (characteristic.characteristicUuid ==
          Guid(KeyConstants.startOtaCharacteristicUuid)) {
        startCharacteristic = characteristic;
      } else if (characteristic.characteristicUuid ==
          Guid(KeyConstants.stopOtaCharacteristicUuid)) {
        stopCharacteristic = characteristic;
      } else if (characteristic.characteristicUuid ==
          Guid(KeyConstants.uploadOtaCharacteristicUuid)) {
        uploadCharacteristic = characteristic;
      }
    }

    // Check if all OTA characteristics are found & update firmware
    if (startCharacteristic != null &&
        stopCharacteristic != null &&
        uploadCharacteristic != null) {
      _uploadUtils.postCommandStart(
        characteristic: startCharacteristic,
        firmwareBytes: await selectedFile!.readAsBytes(),
        onAckReceived: () async {
          _uploadUtils.updateFirmware(
            characteristic: uploadCharacteristic!,
            firmwareFile: selectedFile!,
            mtu: await widget.device.mtu.first,
            onSuccess: () {
              _uploadUtils.postCommandEnd(characteristic: stopCharacteristic!);
            },
            onError: (code) {},
          );
        },
      );
    } else {
      log('OTA characteristics not found');
    }
  }

  @override
  void initState() {
    if (widget.device.isConnected) {
      discoverServices();
    } else {
      log('Device is not connected');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Device Info',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        leadingWidth: 34,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 14,
          children: [
            Text(
              'Device Name: ${widget.device.platformName}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Remote ID: ${widget.device.remoteId}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            if (characteristics.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: characteristics.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 20,
                        ),
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10,
                          children: [
                            Text(
                              'Charecteristics ID: ${characteristics[index].characteristicUuid}',
                            ),
                            Text(
                              'service ID: ${characteristics[index].serviceUuid}',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                );
                if (result != null) {
                  final file = File(result.files.single.path!);
                  setState(() {
                    selectedFile = file;
                    selectedFileName = result.files.first.name;
                  });
                  log('File Path ---------  ${file.path}');
                }
              },
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  selectedFile != null
                      ? (selectedFileName ?? '')
                      : 'Select File',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                startOTA();
              },
              child: Container(
                height: 50,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                alignment: Alignment.center,
                child: Text(
                  selectedFile != null ? (selectedFileName ?? '') : 'Start OTA',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
