import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:ble_test/constants/key_const.dart';
import 'package:ble_test/services/api_services.dart';
import 'package:ble_test/utils/upload_utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo({super.key, required this.device});

  final BluetoothDevice device;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  final _controller = Get.put(DeviceInfoController());

  @override
  void initState() {
    if (widget.device.isConnected) {
      Future.delayed(Duration.zero, () {
        _controller.discoverServices(device: widget.device);
      });
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
              Get.delete<DeviceInfoController>();
            },
            padding: EdgeInsets.zero,
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Obx(() {
          return Column(
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
              if (_controller.characteristics.isNotEmpty)
                GestureDetector(
                  onTap: () async {
                    await _controller.checkForUpdate();
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
                      _controller.isChecking
                          ? 'Checking for update...'
                          : 'Check for update',
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
              if (_controller.version.isNotEmpty &&
                  _controller.fileDownloadUrl.isNotEmpty) ...[
                RichText(
                  text: TextSpan(
                    text:
                        'Update available, Tap start to update on v${_controller.version}, To change it to ${!_controller.isAutoUpdate ? 'auto' : 'manual'} mode tap on',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text:
                            ' ${!_controller.isAutoUpdate ? 'Auto' : 'Manual'}.',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                _controller.changeUpdateMode();
                              },
                      ),
                    ],
                  ),
                ),
                if (!_controller.isAutoUpdate)
                  if (_controller.selectedFileName.isNotEmpty)
                    Text(
                      'Firmware File: ${_controller.selectedFileName}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  else
                    RichText(
                      text: TextSpan(
                        text: 'Click ',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.blue,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                _controller.pickFirmwareFile();
                              },
                        children: [
                          TextSpan(
                            text: 'to select firmware file.',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                GestureDetector(
                  onTap: () {
                    if (_controller.isAutoUpdate) {
                      _controller.downloadFirmware(
                        url: _controller.fileDownloadUrl,
                      );
                    } else {
                      _controller.startOTA(
                        file: File(_controller.selectedFilePath),
                      );
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
                      '${_controller.otaStatus} ${_controller.otaStatus == 'Downloading'
                          ? '${_controller.downloadProgress}%'
                          : _controller.otaStatus == 'Updating'
                          ? '${_controller.updateProgress}%'
                          : ''}',
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
            ],
          );
        }),
      ),
    );
  }
}

class DeviceInfoController extends GetxController {
  final UploadUtils _uploadUtils = UploadUtils();
  final RxString _otaStatus = 'Start OTA'.obs;
  final RxString _version = ''.obs;
  final RxString _fileDownloadUrl = ''.obs;
  final RxBool _isAutoUpdate = true.obs;
  final RxInt _mtu = 512.obs;
  final RxInt _downloadProgress = 0.obs;
  final RxInt _updateProgress = 0.obs;
  final RxString _selectedFileName = ''.obs;
  final RxString _selectedFilePath = ''.obs;
  final RxBool _isChecking = false.obs;
  final RxList<BluetoothCharacteristic> _characteristics =
      <BluetoothCharacteristic>[].obs;

  String get otaStatus => _otaStatus.value;
  bool get isAutoUpdate => _isAutoUpdate.value;
  String get version => _version.value;
  String get fileDownloadUrl => _fileDownloadUrl.value;
  int get mtu => _mtu.value;
  int get downloadProgress => _downloadProgress.value;
  int get updateProgress => _updateProgress.value;
  String get selectedFileName => _selectedFileName.value;
  String get selectedFilePath => _selectedFilePath.value;
  bool get isChecking => _isChecking.value;
  List<BluetoothCharacteristic> get characteristics => _characteristics;

  set otaStatus(String val) => _otaStatus.value = val;
  set isAutoUpdate(bool val) => _isAutoUpdate.value = val;
  set version(String val) => _version.value = val;
  set mtu(int val) => _mtu.value = val;
  set fileDownloadUrl(String val) => _fileDownloadUrl.value = val;
  set downloadProgress(int val) => _downloadProgress.value = val;
  set updateProgress(int val) => _updateProgress.value = val;
  set selectedFileName(String val) => _selectedFileName.value = val;
  set selectedFilePath(String val) => _selectedFilePath.value = val;
  set isChecking(bool val) => _isChecking.value = val;
  set characteristics(List<BluetoothCharacteristic> val) =>
      _characteristics.value = val;

  Future<void> discoverServices({required BluetoothDevice device}) async {
    List<BluetoothService> services = await device.discoverServices();
    final List<BluetoothCharacteristic> c = [];
    for (BluetoothService service in services) {
      for (BluetoothCharacteristic characteristic in service.characteristics) {
        c.add(characteristic);
      }
    }
    characteristics = c;
    await setMtu(device: device);
  }

  Future<void> setMtu({required BluetoothDevice device}) async {
    if (Platform.isAndroid) {
      await device.requestConnectionPriority(
        connectionPriorityRequest: ConnectionPriority.high,
      );
      final result = await device.requestMtu(517);
      mtu = result;
    }
  }

  Future<void> checkForUpdate() async {
    isChecking = true;
    final result = await ApiService().fetchFirmware(currentVersion: 1.0);
    if (result != null) {
      version = result.version;
      fileDownloadUrl = result.fileDownloadUrl;
      log('Response: ${result.toJson()}');
      isChecking = false;
    }
  }

  Future<void> downloadFirmware({required String url}) async {
    if (url.isEmpty) return;
    otaStatus = 'Downloading';
    final downloadUrl = await ApiService().downloadFirmware(
      url: url,
      onProgress: (value) {
        if (value > 0) {
          log('Download progress: $value');
          downloadProgress = value.toInt();
        }
      },
    );
    if (downloadUrl != null) {
      final file = File(downloadUrl);

      startOTA(file: file);
    }
  }

  Future<void> pickFirmwareFile() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['bin'],
    );
    if (result != null) {
      selectedFileName = result.files.first.name;
      selectedFilePath = result.files.first.path!;
    }
  }

  void startOTA({required File file}) async {
    BluetoothCharacteristic? startCharacteristic;
    BluetoothCharacteristic? stopCharacteristic;
    BluetoothCharacteristic? uploadCharacteristic;

    // Fetch OTA characteristics
    for (final characteristic in characteristics) {
      if (characteristic.characteristicUuid ==
          Guid(KeyConstants.startOtaCharacteristicUuid)) {
        startCharacteristic = characteristic;
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
      otaStatus = 'Updating';
      _uploadUtils.postCommandStart(
        characteristic: startCharacteristic,
        firmwareBytes: await file.readAsBytes(),
        onAckReceived: () async {
          _uploadUtils.updateFirmware(
            characteristic: uploadCharacteristic!,
            firmwareFile: file,
            mtu: mtu,
            onProgress: (value) {
              if (value > 0) {
                log('OTA progress: $value');
                updateProgress = value.toInt();
              }
            },
            onSuccess: () {
              _uploadUtils.postCommandEnd(characteristic: stopCharacteristic!);
              otaStatus = 'OTA Success';
            },
            onError: (code) {},
          );
        },
      );
    } else {
      log('OTA characteristics not found');
      otaStatus = 'OTA Failed';
    }
  }

  void changeUpdateMode() {
    isAutoUpdate = !isAutoUpdate;
  }
}
