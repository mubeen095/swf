part of 'upload_doc_bloc.dart';

@freezed
class UploadDocEvent with _$UploadDocEvent {
  const factory UploadDocEvent.started() = _Started;
  const factory UploadDocEvent.goToNextStep() = _GoToNextStep;
  const factory UploadDocEvent.goToPreviousStep() = _GoToPreviousStep;
  const factory UploadDocEvent.dismissValidationError() = _DismissValidationError;

  //Personal info events
  const factory UploadDocEvent.fullNameChanged(String fullName) =
      _FullNameChanged;
  const factory UploadDocEvent.temporaryAddressChanged(String tempAddress) =
      _TemporaryAddressChanged;
  const factory UploadDocEvent.permanantAddressChanged(String permAddress) =
      _PermanantAddressChanged;
  const factory UploadDocEvent.fatherNameChanged(String fatherName) =
      _FatherNameChanged;
  const factory UploadDocEvent.dobChanged(String dob) = _DOBChanged;
  const factory UploadDocEvent.uploadPersonalInfo() = _UploadPersonalInfo;

  // Photo upload events
  const factory UploadDocEvent.ppSizePhotoChanged(dynamic photo) =
      _PPSizePhotoChanged;
  const factory UploadDocEvent.fullSizePhotoChanged(dynamic photo) =
      _FullSizePhotoChanged;
  const factory UploadDocEvent.uploadPhotos() = _UploadPhotos;

  // Passport upload events
  const factory UploadDocEvent.passportPhotoChanged(dynamic photo) =
      _PassportPhotoChanged;
  const factory UploadDocEvent.passportNumberChanged(String passportNumber) =
      _PassportNumberChanged;
  const factory UploadDocEvent.passportIssueDateChanged(String issueDate) =
      _PassportIssueDateChanged;
  const factory UploadDocEvent.uploadPassportInfo() = _UploadPassportInfo;

  //  Resume upload events
  const factory UploadDocEvent.resumeChanged(File resume) = _ResumeChanged;
  const factory UploadDocEvent.uploadResume() = _UploadResume;

  // Educational document evnets
  const factory UploadDocEvent.eduDocPhotoChanged(File document) =
      _EduDocPhotoChanged;
  const factory UploadDocEvent.eduLevelChanged(String level) = _EduLevelChanged;
  const factory UploadDocEvent.eduPassYearChanged(String passyear) =
      _EduPassYearChanged;
  const factory UploadDocEvent.eduInstituteNameChanged(String institutename) =
      _EduInstituteNameChanged;
  const factory UploadDocEvent.uploadEduDocs() = _UploadEduDocs;

  // Language events
  const factory UploadDocEvent.languageSelected(String language) =
      _LanguageSelected;
  const factory UploadDocEvent.uploadLanguage() = _UploadLanguage;

  // Work events
  const factory UploadDocEvent.workPositionChanged(String position) =
      _WorkPositionChanged;
  const factory UploadDocEvent.workCompanyChanged(String company) =
      _WorkCompanyChanged;
  const factory UploadDocEvent.workAddressChanged(String workAddress) =
      _WorkAddressChanged;
  const factory UploadDocEvent.workDescriptionChanged(String description) =
      _WorkDescriptionChanged;
  const factory UploadDocEvent.uploadWorkHistory() = _UploadWorkHistory;

  // Bank Details events
  const factory UploadDocEvent.bankNameChanged(String bankName) =
      _BankNameChanged;
  const factory UploadDocEvent.bankBranchChanged(String branchName) =
      _BankBranchChanged;
  const factory UploadDocEvent.bankAcHoldersNameChanged(String holdersName) =
      _BankAcHoldersNameChanged;
  const factory UploadDocEvent.bankAcNumberChanged(String acNumber) =
      _BankAcNumberChanged;
  const factory UploadDocEvent.uploadBankDetails() = _UploadBankDetails;

  // Work/Company categories events
  const factory UploadDocEvent.companyCategoryChanged(String companyCategory) =
      _CompanyCategoryChanged;
  const factory UploadDocEvent.uploadCompanyCategories() =
      _UploadCompanyCategories;
}
