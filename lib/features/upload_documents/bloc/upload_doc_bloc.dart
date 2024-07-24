import 'dart:io';

import 'package:coffee_shop/core/helpers/cache_manager.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/upload_documents/controllers/upload_docs_controller.dart';
import 'package:coffee_shop/features/upload_documents/models/personal_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'upload_doc_event.dart';
part 'upload_doc_state.dart';
part 'upload_doc_bloc.freezed.dart';

@injectable
class UploadDocBloc extends Bloc<UploadDocEvent, UploadDocState> {
  final UploadDocsController docsController;
  UploadDocBloc(this.docsController)
      : super(
          UploadDocState(
            personalInfoFormKey: GlobalKey<FormState>(),
            passportFormKey: GlobalKey<FormState>(),
            eduFormKey: GlobalKey<FormState>(),
            workExperienceFormKey: GlobalKey<FormState>(),
            bankDetailFormKey: GlobalKey<FormState>(),
          ),
        ) {
    on<UploadDocEvent>((event, emit) async {
      await event.map(
        started: (event) => null,
        goToNextStep: (event) => _goToNext(event, emit),
        goToPreviousStep: (event) => _goToPreviousStep(event, emit),
        dismissValidationError: (event) =>
            _onDismissValidationError(event, emit),

        // Personal info event to state
        fullNameChanged: (event) => _onFullNameChanged(event, emit),
        permanantAddressChanged: (event) =>
            _onPermanantAddressChanged(event, emit),
        temporaryAddressChanged: (event) =>
            _onTemporaryAddressChanged(event, emit),
        fatherNameChanged: (event) => _onFatherNameChanged(event, emit),
        dobChanged: (event) => _onDOBChanged(event, emit),
        uploadPersonalInfo: (event) => _onUploadPersonalInfo(event, emit),

        // Photo upload event to state
        ppSizePhotoChanged: (event) => _onPPSizePhotoChanged(event, emit),
        fullSizePhotoChanged: (event) => _onFullSizePhotoChanged(event, emit),
        uploadPhotos: (event) => _onUploadPhotos(event, emit),

        // Passport upload event to state
        passportPhotoChanged: (event) => _onPassportPhotoChanged(event, emit),
        passportNumberChanged: (event) => _onPassportNumberChanged(event, emit),
        passportIssueDateChanged: (event) =>
            _onPassportIssueDateChanged(event, emit),
        uploadPassportInfo: (event) => _onUploadPassportInfo(event, emit),

        //Resume upload events to state
        resumeChanged: (event) => _onResumeChanged(event, emit),
        uploadResume: (event) => _onUploadResume(event, emit),

        // Educational document and info states
        eduLevelChanged: (event) => _onEduLevelChanged(event, emit),
        eduInstituteNameChanged: (event) =>
            _onEduInstituteNameChanged(event, emit),
        eduPassYearChanged: (event) => _onEduPassYearChanged(event, emit),
        eduDocPhotoChanged: (event) => _onEduDocPhotoChanged(event, emit),
        uploadEduDocs: (event) => _onUploadEduDocs(event, emit),

        //Language events to state
        languageSelected: (event) => _onLanguageSelected(event, emit),
        uploadLanguage: (event) => _onUploadLanguage(event, emit),

        //Work History events to states
        workPositionChanged: (event) => _onWorkPositionChanged(event, emit),
        workCompanyChanged: (event) => _onWorkCompanyChanged(event, emit),
        workAddressChanged: (event) => _onWorkAddressChanged(event, emit),
        workDescriptionChanged: (event) =>
            _onWorkDescriptionChanged(event, emit),
        uploadWorkHistory: (event) => _onUploadWorkHistory(event, emit),

        //Bank Details events to state
        bankNameChanged: (event) => _onBankNameChanged(event, emit),
        bankBranchChanged: (event) => _onBranchChanged(event, emit),
        bankAcHoldersNameChanged: (event) =>
            _onAcHoldersNameChanged(event, emit),
        bankAcNumberChanged: (event) => _onbankAcNumberChanged(event, emit),
        uploadBankDetails: (event) => _onUploadBankDetails(event, emit),

        // Company categories event to statee
        companyCategoryChanged: (event) =>
            _onCompanyCategoryChanged(event, emit),
        uploadCompanyCategories: (event) =>
            _onUploadCompanyCategories(event, emit),
      );
    });
  }
  _goToNext(_GoToNextStep event, Emitter<UploadDocState> emit) {
    emit(state.copyWith(step: state.step + 1));
  }

  _goToPreviousStep(_GoToPreviousStep event, Emitter<UploadDocState> emit) {
    if (state.step > 0) {
      emit(state.copyWith(
          step: state.step - 1,
          hasValidationError: false,
          validationError: null));
    }
  }

  _onDismissValidationError(
      _DismissValidationError event, Emitter<UploadDocState> emit) {
    emit(state.copyWith(hasValidationError: false, validationError: null));
  }

//Personal Info event to state
  _onFullNameChanged(_FullNameChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(fullName: event.fullName, hasValidationError: false));

  _onPermanantAddressChanged(
          _PermanantAddressChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(
          permanantAddress: event.permAddress, hasValidationError: false));

  _onTemporaryAddressChanged(
          _TemporaryAddressChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(
          temporaryAddress: event.tempAddress, hasValidationError: false));

  _onFatherNameChanged(
          _FatherNameChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(
          fatherName: event.fatherName, hasValidationError: false));

  _onDOBChanged(_DOBChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(birthDate: event.dob, hasValidationError: false));

  _onUploadPersonalInfo(
      _UploadPersonalInfo event, Emitter<UploadDocState> emit) async {
    if (state.personalInfoFormKey.currentState!.validate()) {
      emit(state.copyWith(uploadStatus: UploadStatus.uploading));

      final PersonalInfo personalInfo = PersonalInfo(
          fullName: state.fatherName!,
          permanentAddress: state.permanantAddress!,
          temporaryAddress: state.temporaryAddress!,
          fatherName: state.fatherName!,
          dob: state.birthDate!,
          height: state.height,
          weight: state.weight);
      final failureOrSuccess =
          await docsController.uploadPersonalInfo(personalInfo);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Upload photo event to state.
  _onPPSizePhotoChanged(
          _PPSizePhotoChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(ppSizePhoto: event.photo, hasValidationError: false));
  _onFullSizePhotoChanged(
          _FullSizePhotoChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(
          fullSizePhoto: event.photo, hasValidationError: false));
  _onUploadPhotos(_UploadPhotos event, Emitter<UploadDocState> emit) async {
    if (state.fullSizePhoto == null || state.ppSizePhoto == null) {
      emit(state.copyWith(
          hasValidationError: true,
          validationError: "Please choose required photos"));
    } else {
      emit(state.copyWith(
        hasValidationError: false,
        validationError: null,
        uploadStatus: UploadStatus.uploading,
      ));
      final failureOrSuccess = await docsController.uploadPhotos(
          state.ppSizePhoto!, state.fullSizePhoto!);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Upload passport event to state
  _onPassportPhotoChanged(
          _PassportPhotoChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(passportPhoto: event.photo));

  _onPassportNumberChanged(
          _PassportNumberChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(passportNumber: event.passportNumber));

  _onPassportIssueDateChanged(
          _PassportIssueDateChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(issueDate: event.issueDate));

  _onUploadPassportInfo(
      _UploadPassportInfo event, Emitter<UploadDocState> emit) async {
    if (state.passportFormKey.currentState!.validate()) {
      if (state.passportPhoto == null) {
        emit(state.copyWith(
            hasValidationError: true,
            validationError: "Please choose passport photo"));
      } else {
        emit(state.copyWith(
            hasValidationError: false,
            validationError: null,
            uploadStatus: UploadStatus.uploading));
        final failureOrSuccess = await docsController.uploadPassportInfo(
            state.passportPhoto!, state.passportNumber!, state.issueDate!);
        failureOrSuccess.fold(
            (l) =>
                emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
            (r) => emit(state.copyWith(
                uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
      }
    }
  }

  //Resume upload

  _onResumeChanged(_ResumeChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(resume: event.resume));

  _onUploadResume(_UploadResume event, Emitter<UploadDocState> emit) async {
    if (state.resume == null) {
      emit(state.copyWith(
          hasValidationError: true,
          validationError: "Please choose recently updated resume"));
    } else {
      emit(state.copyWith(
          hasValidationError: false,
          validationError: null,
          uploadStatus: UploadStatus.uploading));
      final failureOrSuccess = await docsController.uploadResume(state.resume!);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Educational document events to states

  _onEduLevelChanged(_EduLevelChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(eduLevel: event.level));

  _onEduInstituteNameChanged(
          _EduInstituteNameChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(eduInstituteName: event.institutename));

  _onEduPassYearChanged(
          _EduPassYearChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(eduPassYear: event.passyear));

  _onEduDocPhotoChanged(
          _EduDocPhotoChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(eduDocPhoto: event.document));

  _onUploadEduDocs(_UploadEduDocs event, Emitter<UploadDocState> emit) async {
    if (state.eduDocPhoto == null) {
      emit(state.copyWith(
          hasValidationError: true,
          validationError: "Please provide your latest educational document"));
    } else {
      if (state.eduFormKey.currentState!.validate()) {
        emit(state.copyWith(
            hasValidationError: false,
            validationError: null,
            uploadStatus: UploadStatus.uploading));
        final failureOrSuccess = await docsController.uploadEduDocs(
            state.eduDocPhoto!,
            state.eduPassYear!,
            state.eduInstituteName!,
            state.eduLevel!);
        failureOrSuccess.fold(
            (l) =>
                emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
            (r) => emit(state.copyWith(
                uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
      }
    }
  }

// Language events
  _onLanguageSelected(_LanguageSelected event, Emitter<UploadDocState> emit) {
    final List<String> updatedLanguages = List<String>.from(state.languages);

    if (updatedLanguages.contains(event.language)) {
      updatedLanguages.remove(event.language);
    } else {
      updatedLanguages.add(event.language);
    }
    emit(
        state.copyWith(languages: updatedLanguages, hasValidationError: false));
  }

  _onUploadLanguage(_UploadLanguage event, Emitter<UploadDocState> emit) async {
    if (state.languages.isEmpty) {
      emit(state.copyWith(
          hasValidationError: true,
          validationError: "Please select at least one language"));
    } else {
      emit(state.copyWith(
          hasValidationError: false,
          validationError: null,
          uploadStatus: UploadStatus.uploading));
      final failureOrSuccess =
          await docsController.uploadLanguages(state.languages);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Work Experience events to state

  _onWorkPositionChanged(
          _WorkPositionChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(workPosition: event.position));

  _onWorkCompanyChanged(
          _WorkCompanyChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(workCompany: event.company));

  _onWorkAddressChanged(
          _WorkAddressChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(workAddress: event.workAddress));

  _onWorkDescriptionChanged(
          _WorkDescriptionChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(workDescription: event.description));

  _onUploadWorkHistory(
      _UploadWorkHistory event, Emitter<UploadDocState> emit) async {
    if (state.workExperienceFormKey.currentState!.validate()) {
      emit(state.copyWith(
          hasValidationError: false, uploadStatus: UploadStatus.uploading));
      final failureOrSuccess = await docsController.uploadWorkExperience(
          state.workPosition!,
          state.workCompany!,
          state.workAddress!,
          state.workDescription!);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Bank Details
  _onBankNameChanged(_BankNameChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(bankName: event.bankName));

  _onBranchChanged(_BankBranchChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(bankBranch: event.branchName));

  _onAcHoldersNameChanged(
          _BankAcHoldersNameChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(bankAcHoldersName: event.holdersName));

  _onbankAcNumberChanged(
          _BankAcNumberChanged event, Emitter<UploadDocState> emit) =>
      emit(state.copyWith(bankAcNumber: event.acNumber));

  _onUploadBankDetails(
      _UploadBankDetails event, Emitter<UploadDocState> emit) async {
    if (state.bankDetailFormKey.currentState!.validate()) {
      emit(state.copyWith(uploadStatus: UploadStatus.uploading));
      final failureOrSuccess = await docsController.uploadBankDetails(
          state.bankName!,
          state.bankBranch!,
          state.bankAcHoldersName!,
          state.bankAcNumber);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) => emit(state.copyWith(
              uploadStatus: UploadStatus.uploaded, step: state.step + 1)));
    }
  }

  // Company events to state
  _onCompanyCategoryChanged(
      _CompanyCategoryChanged event, Emitter<UploadDocState> emit) {
    final List<String> updatedCompanies =
        List<String>.from(state.companyCategories);

    if (updatedCompanies.contains(event.companyCategory)) {
      updatedCompanies.remove(event.companyCategory);
    } else {
      updatedCompanies.add(event.companyCategory);
    }
    emit(state.copyWith(
        companyCategories: updatedCompanies, hasValidationError: false));
  }

  _onUploadCompanyCategories(
      _UploadCompanyCategories event, Emitter<UploadDocState> emit) async {
    if (state.companyCategories.isEmpty) {
      emit(state.copyWith(
          hasValidationError: true,
          validationError: "Please select at least one cateegory"));
    } else {
      emit(state.copyWith(
          uploadStatus: UploadStatus.uploading,
          hasValidationError: false,
          validationError: null));
      final failureOrSuccess =
          await docsController.uploadCompanyCategories(state.companyCategories);
      failureOrSuccess.fold(
          (l) => emit(state.copyWith(uploadStatus: UploadStatus.uploadFailure)),
          (r) {
        emit(state.copyWith(uploadStatus: UploadStatus.uploaded));
      });
    }
  }
}
