import 'dart:developer';
import 'dart:io';
import 'package:ble_test/api/api_const.dart';
import 'package:ble_test/model/firmware_model.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _token = ApiConst.token;
  final String _baseUrl = ApiConst.baseUrl;

  Future<Firmware?> fetchFirmware({required double currentVersion}) async {
    final String url = ApiConst.getFirmwareUrl(
      page: 1,
      limit: 10,
      productId: 3,
      generationId: 8,
    );
    try {
      final response = await _dio.get(
        _baseUrl + url,
        options: Options(headers: {'Authorization': 'Bearer $_token'}),
      );
      final data = response.data['data']['firmwares'];
      if (data != null && data is List) {
        final firmwareList =
            data.map((item) => Firmware.fromJson(item)).toList();
        return firmwareList.first;
      }
    } catch (e) {
      log('Exception occurred: $e');
    }
    return null;
  }

  Future<String?> downloadFirmware({
    required String url,
    void Function(double)? onProgress,
  }) async {
    if (url.isEmpty) return null;
    try {
      final tempDir = await getTemporaryDirectory();
      final filePath = "${tempDir.path}/ble_ota_update_${DateTime.now()}.bin";

      final response = await _dio.download(
        url,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            final progress = (received / total * 100);
            onProgress?.call(progress);
          }
        },
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: true,
          receiveTimeout: const Duration(minutes: 2),
        ),
      );

      if (response.statusCode == 200) {
        log(
          "Downloaded firmware to $filePath & ${File(filePath).lengthSync()} bytes",
        );
        return filePath;
      }

      return null;
    } catch (e) {
      log("Download failed: $e");
      return null;
    }
  }
}
