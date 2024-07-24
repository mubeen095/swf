part of 'upload_doc_bloc.dart';

@freezed
class UploadDocState with _$UploadDocState {
  const factory UploadDocState({
    @Default(0) int step,
    @Default(UploadStatus.initial) UploadStatus uploadStatus,

    // Errors like not selecting photos , docs
    @Default(false) bool hasValidationError,
    String? validationError,

    // Personal Information Form contents
    required GlobalKey<FormState> personalInfoFormKey,
    String? fullName,
    String? permanantAddress,
    String? temporaryAddress,
    String? fatherName,
    String? birthDate,
    @Default(5.6) double height,
    @Default(69.0) double weight,

    // Photo upload states
    File? ppSizePhoto,
    File? fullSizePhoto,

    // Passport upload state
    required GlobalKey<FormState> passportFormKey,
    File? passportPhoto,
    String? passportNumber,
    String? issueDate,

    // Resume
    File? resume,

    // Educational Documents
    required GlobalKey<FormState> eduFormKey,
    File? eduDocPhoto,
    String? eduLevel,
    String? eduPassYear,
    String? eduInstituteName,

    // Language
    @Default([]) List<String> languages,

    //Work Experience
    required GlobalKey<FormState> workExperienceFormKey,
    String? workPosition,
    String? workCompany,
    String? workAddress,
    String? workDescription,

    //Bank Details
    required GlobalKey<FormState> bankDetailFormKey,
    String? bankName,
    String? bankBranch,
    String? bankAcHoldersName,
    String? bankAcNumber,

    // Work/Company category
    @Default([])List<String> companyCategories

  }) = _UploadDocState;
}

enum UploadStatus {
  initial,
  uploading,
  uploaded,
  uploadFailure,
}
