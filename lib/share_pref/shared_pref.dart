import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static const String deviceIdKey = 'DEVICE_ID';

  Future<void> saveDeviceId(List<String> devicIds) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(deviceIdKey, devicIds);
  }

  Future<List<String>> getDeviceIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(deviceIdKey) ?? [];
  }

  Future<void> clearDevicIds() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(deviceIdKey);
  }
}
