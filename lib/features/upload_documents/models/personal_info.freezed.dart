// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personal_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PersonalInfo _$PersonalInfoFromJson(Map<String, dynamic> json) {
  return _PersonalInfo.fromJson(json);
}

/// @nodoc
mixin _$PersonalInfo {
  String get fullName => throw _privateConstructorUsedError;
  String get permanentAddress => throw _privateConstructorUsedError;
  String get temporaryAddress => throw _privateConstructorUsedError;
  String get fatherName => throw _privateConstructorUsedError;
  String get dob => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalInfoCopyWith<PersonalInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoCopyWith<$Res> {
  factory $PersonalInfoCopyWith(
          PersonalInfo value, $Res Function(PersonalInfo) then) =
      _$PersonalInfoCopyWithImpl<$Res, PersonalInfo>;
  @useResult
  $Res call(
      {String fullName,
      String permanentAddress,
      String temporaryAddress,
      String fatherName,
      String dob,
      double height,
      double weight});
}

/// @nodoc
class _$PersonalInfoCopyWithImpl<$Res, $Val extends PersonalInfo>
    implements $PersonalInfoCopyWith<$Res> {
  _$PersonalInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? permanentAddress = null,
    Object? temporaryAddress = null,
    Object? fatherName = null,
    Object? dob = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      permanentAddress: null == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryAddress: null == temporaryAddress
          ? _value.temporaryAddress
          : temporaryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fatherName: null == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalInfoImplCopyWith<$Res>
    implements $PersonalInfoCopyWith<$Res> {
  factory _$$PersonalInfoImplCopyWith(
          _$PersonalInfoImpl value, $Res Function(_$PersonalInfoImpl) then) =
      __$$PersonalInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String permanentAddress,
      String temporaryAddress,
      String fatherName,
      String dob,
      double height,
      double weight});
}

/// @nodoc
class __$$PersonalInfoImplCopyWithImpl<$Res>
    extends _$PersonalInfoCopyWithImpl<$Res, _$PersonalInfoImpl>
    implements _$$PersonalInfoImplCopyWith<$Res> {
  __$$PersonalInfoImplCopyWithImpl(
      _$PersonalInfoImpl _value, $Res Function(_$PersonalInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? permanentAddress = null,
    Object? temporaryAddress = null,
    Object? fatherName = null,
    Object? dob = null,
    Object? height = null,
    Object? weight = null,
  }) {
    return _then(_$PersonalInfoImpl(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      permanentAddress: null == permanentAddress
          ? _value.permanentAddress
          : permanentAddress // ignore: cast_nullable_to_non_nullable
              as String,
      temporaryAddress: null == temporaryAddress
          ? _value.temporaryAddress
          : temporaryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      fatherName: null == fatherName
          ? _value.fatherName
          : fatherName // ignore: cast_nullable_to_non_nullable
              as String,
      dob: null == dob
          ? _value.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PersonalInfoImpl implements _PersonalInfo {
  const _$PersonalInfoImpl(
      {required this.fullName,
      required this.permanentAddress,
      required this.temporaryAddress,
      required this.fatherName,
      required this.dob,
      required this.height,
      required this.weight});

  factory _$PersonalInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalInfoImplFromJson(json);

  @override
  final String fullName;
  @override
  final String permanentAddress;
  @override
  final String temporaryAddress;
  @override
  final String fatherName;
  @override
  final String dob;
  @override
  final double height;
  @override
  final double weight;

  @override
  String toString() {
    return 'PersonalInfo(fullName: $fullName, permanentAddress: $permanentAddress, temporaryAddress: $temporaryAddress, fatherName: $fatherName, dob: $dob, height: $height, weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalInfoImpl &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.permanentAddress, permanentAddress) ||
                other.permanentAddress == permanentAddress) &&
            (identical(other.temporaryAddress, temporaryAddress) ||
                other.temporaryAddress == temporaryAddress) &&
            (identical(other.fatherName, fatherName) ||
                other.fatherName == fatherName) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, permanentAddress,
      temporaryAddress, fatherName, dob, height, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      __$$PersonalInfoImplCopyWithImpl<_$PersonalInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalInfoImplToJson(
      this,
    );
  }
}

abstract class _PersonalInfo implements PersonalInfo {
  const factory _PersonalInfo(
      {required final String fullName,
      required final String permanentAddress,
      required final String temporaryAddress,
      required final String fatherName,
      required final String dob,
      required final double height,
      required final double weight}) = _$PersonalInfoImpl;

  factory _PersonalInfo.fromJson(Map<String, dynamic> json) =
      _$PersonalInfoImpl.fromJson;

  @override
  String get fullName;
  @override
  String get permanentAddress;
  @override
  String get temporaryAddress;
  @override
  String get fatherName;
  @override
  String get dob;
  @override
  double get height;
  @override
  double get weight;
  @override
  @JsonKey(ignore: true)
  _$$PersonalInfoImplCopyWith<_$PersonalInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
