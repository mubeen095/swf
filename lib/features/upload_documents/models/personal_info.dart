
// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part "personal_info.freezed.dart";
part "personal_info.g.dart";

@freezed
class PersonalInfo with _$PersonalInfo{
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory PersonalInfo({
    required String fullName,
  required String permanentAddress,
  required String temporaryAddress,
  required String fatherName,
  required  String dob,
  required double height,
  required double weight,

  })=_PersonalInfo;

  factory PersonalInfo.fromJson(Map<String, dynamic> json) =>
      _$PersonalInfoFromJson(json);

}