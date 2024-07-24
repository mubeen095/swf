// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalInfoImpl _$$PersonalInfoImplFromJson(Map<String, dynamic> json) =>
    _$PersonalInfoImpl(
      fullName: json['full_name'] as String,
      permanentAddress: json['permanent_address'] as String,
      temporaryAddress: json['temporary_address'] as String,
      fatherName: json['father_name'] as String,
      dob: json['dob'] as String,
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$$PersonalInfoImplToJson(_$PersonalInfoImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'permanent_address': instance.permanentAddress,
      'temporary_address': instance.temporaryAddress,
      'father_name': instance.fatherName,
      'dob': instance.dob,
      'height': instance.height,
      'weight': instance.weight,
    };
