import 'package:freezed_annotation/freezed_annotation.dart';

part 'firmware_model.freezed.dart';
part 'firmware_model.g.dart';

@freezed
class Firmware with _$Firmware {
  const factory Firmware({
    required int id,
    required String name,
    required String version,
    required String description,
    required String versionTag,
    required String fileKey,
    required int createdByUserId,
    required int generationId,
    required int productId,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required Product product,
    required Generation generation,
    required String fileDownloadUrl,
  }) = _Firmware;

  factory Firmware.fromJson(Map<String, dynamic> json) =>
      _$FirmwareFromJson(json);
}

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required String name,
    required String description,
    required String imageUrl,
    required String code,
    required int createdByUserId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}

@freezed
class Generation with _$Generation {
  const factory Generation({
    required int id,
    required String name,
    required String description,
    required int createdByUserId,
    required int productId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Generation;

  factory Generation.fromJson(Map<String, dynamic> json) =>
      _$GenerationFromJson(json);
}
