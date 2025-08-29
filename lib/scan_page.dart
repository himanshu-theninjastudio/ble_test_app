import 'dart:async';
import 'dart:developer';
import 'package:ble_test/device_page.dart';
import 'package:ble_test/share_pref/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final ValueNotifier<bool> _isScanning = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isEnabled = ValueNotifier<bool>(false);

  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<BluetoothAdapterState> _adapterStateSubscription;
  late StreamSubscription<bool> _isScanningSubscription;

  final ValueNotifier<List<BluetoothDevice>> _devices =
      ValueNotifier<List<BluetoothDevice>>([]);

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      initBluetooth();
    });
    super.initState();
  }

  Future<void> initBluetooth() async {
    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      setState(() {
        _isScanning.value = state;
        if (!state) {
          FlutterBluePlus.stopScan();
        }
      });
    });

    _adapterStateSubscription = FlutterBluePlus.adapterState.listen((state) {
      setState(() {
        if (state == BluetoothAdapterState.on) {
          _isEnabled.value = true;
        } else {
          _isEnabled.value = false;
        }
      });
    });

    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((
      results,
    ) async {
      _devices.value = results.map((result) => result.device).toList();
    });
  }

  @override
  void dispose() {
    _scanResultsSubscription.cancel();
    _isScanningSubscription.cancel();
    _adapterStateSubscription.cancel();
    super.dispose();
  }

  Future<void> scanDevices() async {
    if (await FlutterBluePlus.isSupported == false) {
      log("Bluetooth not supported by this device");
      return;
    }
    if (!_isEnabled.value) {
      log("Bluetooth is disabled");
      return;
    }

    if (_isScanning.value) return;
    FlutterBluePlus.startScan(
      timeout: const Duration(seconds: 3),
      androidUsesFineLocation: true,
      continuousUpdates: true,
    );
    tryReconnectSavedDevices();
  }

  Future<void> tryReconnectSavedDevices() async {
    final savedIds = await Preferences().getDeviceIds();
    await Future.delayed(Duration(seconds: 3));
    for (final device in _devices.value) {
      if (savedIds.contains(device.remoteId.str)) {
        try {
          await device.connect();
          setState(() {});
          log("Connected to ${device.remoteId.str} ${device.platformName}");
        } catch (e) {
          log("Failed to connect ${device.remoteId.str}: $e");
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Test App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              scanDevices();
            },
            child: Padding(
              padding: EdgeInsets.only(right: 20),
              child: Text(
                _isScanning.value ? 'Scanning' : 'Scan',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body:
          _devices.value.isEmpty && _isScanning.value
              ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 5,
                      strokeCap: StrokeCap.round,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Scanning...",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              )
              : _devices.value.isEmpty
              ? Center(
                child: Text(
                  "No Devices Found!\nTap on Scan button to search devices.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              )
              : SingleChildScrollView(
                child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  itemCount: _devices.value.length,
                  itemBuilder: (context, index) {
                    final device = _devices.value[index];
                    if (device.platformName.isEmpty) return SizedBox.shrink();
                    return GestureDetector(
                      onTap: () {
                        if (device.isConnected) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeviceInfo(device: device),
                            ),
                          );
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        padding: const EdgeInsets.all(20),
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(14),

                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    device.platformName,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'ID: ${device.remoteId.str}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    'MTU: ${device.mtuNow}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.blue.withAlpha(30),
                              borderRadius: BorderRadius.circular(20),
                              onTap: () async {
                                final ids = await Preferences().getDeviceIds();
                                if (device.isConnected) {
                                  await device.disconnect();
                                  if (ids.contains(device.remoteId.str)) {
                                    ids.remove(device.remoteId.str);
                                    Preferences().saveDeviceId(ids);
                                  }
                                } else {
                                  await device.connect();
                                  if (!ids.contains(device.remoteId.str)) {
                                    ids.add(device.remoteId.str);
                                    Preferences().saveDeviceId(ids);
                                  }
                                }
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),

                                child: Text(
                                  device.isConnected ? 'Disconnect' : 'Connect',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        device.isConnected
                                            ? Colors.blue
                                            : Colors.blue.shade200,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
    );
  }
}
