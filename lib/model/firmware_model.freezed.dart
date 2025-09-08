// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firmware_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Firmware _$FirmwareFromJson(Map<String, dynamic> json) {
  return _Firmware.fromJson(json);
}

/// @nodoc
mixin _$Firmware {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get versionTag => throw _privateConstructorUsedError;
  String get fileKey => throw _privateConstructorUsedError;
  int get createdByUserId => throw _privateConstructorUsedError;
  int get generationId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  DateTime? get deletedAt => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  Generation get generation => throw _privateConstructorUsedError;
  String get fileDownloadUrl => throw _privateConstructorUsedError;

  /// Serializes this Firmware to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FirmwareCopyWith<Firmware> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirmwareCopyWith<$Res> {
  factory $FirmwareCopyWith(Firmware value, $Res Function(Firmware) then) =
      _$FirmwareCopyWithImpl<$Res, Firmware>;
  @useResult
  $Res call({
    int id,
    String name,
    String version,
    String description,
    String versionTag,
    String fileKey,
    int createdByUserId,
    int generationId,
    int productId,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    Product product,
    Generation generation,
    String fileDownloadUrl,
  });

  $ProductCopyWith<$Res> get product;
  $GenerationCopyWith<$Res> get generation;
}

/// @nodoc
class _$FirmwareCopyWithImpl<$Res, $Val extends Firmware>
    implements $FirmwareCopyWith<$Res> {
  _$FirmwareCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? version = null,
    Object? description = null,
    Object? versionTag = null,
    Object? fileKey = null,
    Object? createdByUserId = null,
    Object? generationId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? product = null,
    Object? generation = null,
    Object? fileDownloadUrl = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            version:
                null == version
                    ? _value.version
                    : version // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            versionTag:
                null == versionTag
                    ? _value.versionTag
                    : versionTag // ignore: cast_nullable_to_non_nullable
                        as String,
            fileKey:
                null == fileKey
                    ? _value.fileKey
                    : fileKey // ignore: cast_nullable_to_non_nullable
                        as String,
            createdByUserId:
                null == createdByUserId
                    ? _value.createdByUserId
                    : createdByUserId // ignore: cast_nullable_to_non_nullable
                        as int,
            generationId:
                null == generationId
                    ? _value.generationId
                    : generationId // ignore: cast_nullable_to_non_nullable
                        as int,
            productId:
                null == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            deletedAt:
                freezed == deletedAt
                    ? _value.deletedAt
                    : deletedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime?,
            product:
                null == product
                    ? _value.product
                    : product // ignore: cast_nullable_to_non_nullable
                        as Product,
            generation:
                null == generation
                    ? _value.generation
                    : generation // ignore: cast_nullable_to_non_nullable
                        as Generation,
            fileDownloadUrl:
                null == fileDownloadUrl
                    ? _value.fileDownloadUrl
                    : fileDownloadUrl // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerationCopyWith<$Res> get generation {
    return $GenerationCopyWith<$Res>(_value.generation, (value) {
      return _then(_value.copyWith(generation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FirmwareImplCopyWith<$Res>
    implements $FirmwareCopyWith<$Res> {
  factory _$$FirmwareImplCopyWith(
    _$FirmwareImpl value,
    $Res Function(_$FirmwareImpl) then,
  ) = __$$FirmwareImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String version,
    String description,
    String versionTag,
    String fileKey,
    int createdByUserId,
    int generationId,
    int productId,
    DateTime createdAt,
    DateTime updatedAt,
    DateTime? deletedAt,
    Product product,
    Generation generation,
    String fileDownloadUrl,
  });

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $GenerationCopyWith<$Res> get generation;
}

/// @nodoc
class __$$FirmwareImplCopyWithImpl<$Res>
    extends _$FirmwareCopyWithImpl<$Res, _$FirmwareImpl>
    implements _$$FirmwareImplCopyWith<$Res> {
  __$$FirmwareImplCopyWithImpl(
    _$FirmwareImpl _value,
    $Res Function(_$FirmwareImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? version = null,
    Object? description = null,
    Object? versionTag = null,
    Object? fileKey = null,
    Object? createdByUserId = null,
    Object? generationId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? deletedAt = freezed,
    Object? product = null,
    Object? generation = null,
    Object? fileDownloadUrl = null,
  }) {
    return _then(
      _$FirmwareImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        version:
            null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        versionTag:
            null == versionTag
                ? _value.versionTag
                : versionTag // ignore: cast_nullable_to_non_nullable
                    as String,
        fileKey:
            null == fileKey
                ? _value.fileKey
                : fileKey // ignore: cast_nullable_to_non_nullable
                    as String,
        createdByUserId:
            null == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                    as int,
        generationId:
            null == generationId
                ? _value.generationId
                : generationId // ignore: cast_nullable_to_non_nullable
                    as int,
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        deletedAt:
            freezed == deletedAt
                ? _value.deletedAt
                : deletedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime?,
        product:
            null == product
                ? _value.product
                : product // ignore: cast_nullable_to_non_nullable
                    as Product,
        generation:
            null == generation
                ? _value.generation
                : generation // ignore: cast_nullable_to_non_nullable
                    as Generation,
        fileDownloadUrl:
            null == fileDownloadUrl
                ? _value.fileDownloadUrl
                : fileDownloadUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FirmwareImpl implements _Firmware {
  const _$FirmwareImpl({
    required this.id,
    required this.name,
    required this.version,
    required this.description,
    required this.versionTag,
    required this.fileKey,
    required this.createdByUserId,
    required this.generationId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.product,
    required this.generation,
    required this.fileDownloadUrl,
  });

  factory _$FirmwareImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirmwareImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String version;
  @override
  final String description;
  @override
  final String versionTag;
  @override
  final String fileKey;
  @override
  final int createdByUserId;
  @override
  final int generationId;
  @override
  final int productId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final DateTime? deletedAt;
  @override
  final Product product;
  @override
  final Generation generation;
  @override
  final String fileDownloadUrl;

  @override
  String toString() {
    return 'Firmware(id: $id, name: $name, version: $version, description: $description, versionTag: $versionTag, fileKey: $fileKey, createdByUserId: $createdByUserId, generationId: $generationId, productId: $productId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, product: $product, generation: $generation, fileDownloadUrl: $fileDownloadUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirmwareImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.versionTag, versionTag) ||
                other.versionTag == versionTag) &&
            (identical(other.fileKey, fileKey) || other.fileKey == fileKey) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.generationId, generationId) ||
                other.generationId == generationId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.generation, generation) ||
                other.generation == generation) &&
            (identical(other.fileDownloadUrl, fileDownloadUrl) ||
                other.fileDownloadUrl == fileDownloadUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    version,
    description,
    versionTag,
    fileKey,
    createdByUserId,
    generationId,
    productId,
    createdAt,
    updatedAt,
    deletedAt,
    product,
    generation,
    fileDownloadUrl,
  );

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FirmwareImplCopyWith<_$FirmwareImpl> get copyWith =>
      __$$FirmwareImplCopyWithImpl<_$FirmwareImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirmwareImplToJson(this);
  }
}

abstract class _Firmware implements Firmware {
  const factory _Firmware({
    required final int id,
    required final String name,
    required final String version,
    required final String description,
    required final String versionTag,
    required final String fileKey,
    required final int createdByUserId,
    required final int generationId,
    required final int productId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
    final DateTime? deletedAt,
    required final Product product,
    required final Generation generation,
    required final String fileDownloadUrl,
  }) = _$FirmwareImpl;

  factory _Firmware.fromJson(Map<String, dynamic> json) =
      _$FirmwareImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get version;
  @override
  String get description;
  @override
  String get versionTag;
  @override
  String get fileKey;
  @override
  int get createdByUserId;
  @override
  int get generationId;
  @override
  int get productId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  DateTime? get deletedAt;
  @override
  Product get product;
  @override
  Generation get generation;
  @override
  String get fileDownloadUrl;

  /// Create a copy of Firmware
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FirmwareImplCopyWith<_$FirmwareImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  int get createdByUserId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Product to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String imageUrl,
    String code,
    int createdByUserId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? code = null,
    Object? createdByUserId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            imageUrl:
                null == imageUrl
                    ? _value.imageUrl
                    : imageUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            code:
                null == code
                    ? _value.code
                    : code // ignore: cast_nullable_to_non_nullable
                        as String,
            createdByUserId:
                null == createdByUserId
                    ? _value.createdByUserId
                    : createdByUserId // ignore: cast_nullable_to_non_nullable
                        as int,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
    _$ProductImpl value,
    $Res Function(_$ProductImpl) then,
  ) = __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    String imageUrl,
    String code,
    int createdByUserId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
    _$ProductImpl _value,
    $Res Function(_$ProductImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? imageUrl = null,
    Object? code = null,
    Object? createdByUserId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$ProductImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        imageUrl:
            null == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        code:
            null == code
                ? _value.code
                : code // ignore: cast_nullable_to_non_nullable
                    as String,
        createdByUserId:
            null == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                    as int,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl implements _Product {
  const _$ProductImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.code,
    required this.createdByUserId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String imageUrl;
  @override
  final String code;
  @override
  final int createdByUserId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Product(id: $id, name: $name, description: $description, imageUrl: $imageUrl, code: $code, createdByUserId: $createdByUserId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    imageUrl,
    code,
    createdByUserId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(this);
  }
}

abstract class _Product implements Product {
  const factory _Product({
    required final int id,
    required final String name,
    required final String description,
    required final String imageUrl,
    required final String code,
    required final int createdByUserId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get imageUrl;
  @override
  String get code;
  @override
  int get createdByUserId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Product
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Generation _$GenerationFromJson(Map<String, dynamic> json) {
  return _Generation.fromJson(json);
}

/// @nodoc
mixin _$Generation {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  int get createdByUserId => throw _privateConstructorUsedError;
  int get productId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Generation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerationCopyWith<Generation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerationCopyWith<$Res> {
  factory $GenerationCopyWith(
    Generation value,
    $Res Function(Generation) then,
  ) = _$GenerationCopyWithImpl<$Res, Generation>;
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    int createdByUserId,
    int productId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$GenerationCopyWithImpl<$Res, $Val extends Generation>
    implements $GenerationCopyWith<$Res> {
  _$GenerationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdByUserId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as int,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            createdByUserId:
                null == createdByUserId
                    ? _value.createdByUserId
                    : createdByUserId // ignore: cast_nullable_to_non_nullable
                        as int,
            productId:
                null == productId
                    ? _value.productId
                    : productId // ignore: cast_nullable_to_non_nullable
                        as int,
            createdAt:
                null == createdAt
                    ? _value.createdAt
                    : createdAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
            updatedAt:
                null == updatedAt
                    ? _value.updatedAt
                    : updatedAt // ignore: cast_nullable_to_non_nullable
                        as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GenerationImplCopyWith<$Res>
    implements $GenerationCopyWith<$Res> {
  factory _$$GenerationImplCopyWith(
    _$GenerationImpl value,
    $Res Function(_$GenerationImpl) then,
  ) = __$$GenerationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String name,
    String description,
    int createdByUserId,
    int productId,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$GenerationImplCopyWithImpl<$Res>
    extends _$GenerationCopyWithImpl<$Res, _$GenerationImpl>
    implements _$$GenerationImplCopyWith<$Res> {
  __$$GenerationImplCopyWithImpl(
    _$GenerationImpl _value,
    $Res Function(_$GenerationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? createdByUserId = null,
    Object? productId = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$GenerationImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as int,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        createdByUserId:
            null == createdByUserId
                ? _value.createdByUserId
                : createdByUserId // ignore: cast_nullable_to_non_nullable
                    as int,
        productId:
            null == productId
                ? _value.productId
                : productId // ignore: cast_nullable_to_non_nullable
                    as int,
        createdAt:
            null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
        updatedAt:
            null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                    as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerationImpl implements _Generation {
  const _$GenerationImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.createdByUserId,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$GenerationImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerationImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String description;
  @override
  final int createdByUserId;
  @override
  final int productId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Generation(id: $id, name: $name, description: $description, createdByUserId: $createdByUserId, productId: $productId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdByUserId, createdByUserId) ||
                other.createdByUserId == createdByUserId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    createdByUserId,
    productId,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerationImplCopyWith<_$GenerationImpl> get copyWith =>
      __$$GenerationImplCopyWithImpl<_$GenerationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerationImplToJson(this);
  }
}

abstract class _Generation implements Generation {
  const factory _Generation({
    required final int id,
    required final String name,
    required final String description,
    required final int createdByUserId,
    required final int productId,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$GenerationImpl;

  factory _Generation.fromJson(Map<String, dynamic> json) =
      _$GenerationImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get description;
  @override
  int get createdByUserId;
  @override
  int get productId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Generation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerationImplCopyWith<_$GenerationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
