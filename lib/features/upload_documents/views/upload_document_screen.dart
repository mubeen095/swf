import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/config/routing.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/utils/easy_loading_dialog.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/CompanySelect.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/education_detail.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/bankDetail.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/resume.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/language.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/passportUpload.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/personal_info_form.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/photoUpload.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/workExperience.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class UploadDocumentScreen extends StatefulWidget {
  const UploadDocumentScreen({super.key});

  @override
  State<UploadDocumentScreen> createState() => _UploadDocumentScreenState();
}

class _UploadDocumentScreenState extends State<UploadDocumentScreen> {
  List<Widget> forms = [
    const PersonalInfoForm(),
    PhotoUpload(),
    const PassportUpload(),
    const CvUpload(),
    const EducationDetail(),
    LanguageSelect(),
    const WorkExperience(),
    BankDetail(),
    CompanySelect(active_index: 0)
  ];
  _onNext(BuildContext context, int step) {
    switch (step) {
      case 0:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadPersonalInfo());
        break;
      case 1:
        context.read<UploadDocBloc>().add(const UploadDocEvent.uploadPhotos());
        break;
      case 2:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadPassportInfo());
        break;
      case 3:
        context.read<UploadDocBloc>().add(const UploadDocEvent.uploadResume());
        break;
      case 4:
        context.read<UploadDocBloc>().add(const UploadDocEvent.uploadEduDocs());
        break;
      case 5:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadLanguage());
        break;
      case 6:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadWorkHistory());
        break;
      case 7:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadBankDetails());
        break;
      case 8:
        context
            .read<UploadDocBloc>()
            .add(const UploadDocEvent.uploadCompanyCategories());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<UploadDocBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            body: BlocConsumer<UploadDocBloc, UploadDocState>(
              listenWhen: (previous, current) =>
                  previous.uploadStatus != current.uploadStatus,
              listener: ((context, state) {
                // show loading
               
                if (state.uploadStatus == UploadStatus.uploading) {
                  showLoading();
                } else if (state.uploadStatus == UploadStatus.uploadFailure) {
                  hideLoading();
                  showDefaultSnackBar(context);
                } else if (state.uploadStatus == UploadStatus.uploaded) {
                  hideLoading();
                   if(state.step==8){
                    context.go(AppRoutes.homeRoute);
                   }
                } else {
                  hideLoading();
                }
              }),
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      color: AppColors.primary,
                      child: SafeArea(
                        child: IconStepper(
                          icons: const [
                            Icon(
                              Icons.person,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.photo,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.edit_document,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.school,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.document_scanner,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.language,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.work_history,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.account_balance,
                              color: AppColors.white,
                            ),
                            Icon(
                              Icons.business,
                              color: AppColors.white,
                            ),
                          ],
                          enableNextPreviousButtons: false,
                          stepRadius: 16.0,
                          lineLength: 30,
                          activeStep: state.step,
                          activeStepBorderColor: AppColors.primary,
                          activeStepColor: AppColors.secondary,
                          stepColor: AppColors.primary,
                          enableStepTapping: false,
                        ),
                      ),
                    ),
                    state.hasValidationError
                        ? Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 16.0),
                            color: AppColors.error,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    state.validationError ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium
                                        ?.copyWith(color: AppColors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: InkWell(
                                      onTap: () {
                                        context.read<UploadDocBloc>().add(
                                            UploadDocEvent
                                                .dismissValidationError());
                                      },
                                      child: Icon(Icons.clear,
                                          color: Colors.white)),
                                )
                              ],
                            ))
                        : const SizedBox.shrink(),
                    const Gap(SizeManager.pagePadding),
                    Expanded(
                        child: SingleChildScrollView(
                      child: forms[state.step],
                    ))
                  ],
                );
              },
            ),
            bottomNavigationBar: BlocBuilder<UploadDocBloc, UploadDocState>(
              builder: (context, state) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: InkWell(
                        splashColor: Colors.black,
                        onTap: state.step == 0
                            ? null
                            : () {
                                context.read<UploadDocBloc>().add(
                                    const UploadDocEvent.goToPreviousStep());
                              },
                        child: Container(
                            height: 60.0,
                            alignment: Alignment.center,
                            color: state.step == 0
                                ? AppColors.secondary.withAlpha(90)
                                : AppColors.secondary,
                            child: Text(
                              "Previous",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                      ),
                    ),
                    Flexible(
                      child: InkWell(
                        onTap: () => _onNext(context, state.step),
                        child: Container(
                            height: 60.0,
                            alignment: Alignment.center,
                            color: AppColors.primary,
                            child: Text(
                              "${state.step}",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),
                      ),
                    ),
                  ],
                );
              },
            ));
      }),
    );
  }
}
