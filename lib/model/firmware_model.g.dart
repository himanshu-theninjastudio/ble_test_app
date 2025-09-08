// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firmware_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirmwareImpl _$$FirmwareImplFromJson(Map<String, dynamic> json) =>
    _$FirmwareImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      version: json['version'] as String,
      description: json['description'] as String,
      versionTag: json['versionTag'] as String,
      fileKey: json['fileKey'] as String,
      createdByUserId: (json['createdByUserId'] as num).toInt(),
      generationId: (json['generationId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt:
          json['deletedAt'] == null
              ? null
              : DateTime.parse(json['deletedAt'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      generation: Generation.fromJson(
        json['generation'] as Map<String, dynamic>,
      ),
      fileDownloadUrl: json['fileDownloadUrl'] as String,
    );

Map<String, dynamic> _$$FirmwareImplToJson(_$FirmwareImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'version': instance.version,
      'description': instance.description,
      'versionTag': instance.versionTag,
      'fileKey': instance.fileKey,
      'createdByUserId': instance.createdByUserId,
      'generationId': instance.generationId,
      'productId': instance.productId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'product': instance.product,
      'generation': instance.generation,
      'fileDownloadUrl': instance.fileDownloadUrl,
    };

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      code: json['code'] as String,
      createdByUserId: (json['createdByUserId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'code': instance.code,
      'createdByUserId': instance.createdByUserId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

_$GenerationImpl _$$GenerationImplFromJson(Map<String, dynamic> json) =>
    _$GenerationImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      createdByUserId: (json['createdByUserId'] as num).toInt(),
      productId: (json['productId'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$GenerationImplToJson(_$GenerationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'createdByUserId': instance.createdByUserId,
      'productId': instance.productId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
