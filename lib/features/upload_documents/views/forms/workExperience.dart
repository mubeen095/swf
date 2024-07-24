import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/education_detail.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:csc_picker/csc_picker.dart';

class WorkExperience extends StatefulWidget {
  const WorkExperience({super.key});

  @override
  State<WorkExperience> createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> with FormValidators {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Form(
          key: state.workExperienceFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeadline(title: "Work Experience"),
                // const Gap(SizeManager.pagePadding),
                // CSCPicker(
                //  searchBarRadius: SizeManager.curveValue,
                //   dropdownDialogRadius: SizeManager.curveValue,

                //   onCityChanged: (city) {},
                //   onStateChanged: (state) {},
                //   onCountryChanged: (country) {},
                // ),
                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Position",
                  validator: validateRequired,
                  onChanged: (val) {
                    context.read<UploadDocBloc>().add(UploadDocEvent.workPositionChanged(val));
                  },
                ),

                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Company Name",
                  validator: validateRequired,
                  onChanged: (val) {
                    context.read<UploadDocBloc>().add(UploadDocEvent.workCompanyChanged(val));
                  },
                ),

                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Work address",
                  validator: validateRequired,
                  onChanged: (val) {
                    context.read<UploadDocBloc>().add(UploadDocEvent.workAddressChanged(val));
                  },
                ),

                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Description",
                  maxLines: 5,
                  validator: validateRequired,
                  onChanged: (val) {
                    context.read<UploadDocBloc>().add(UploadDocEvent.workDescriptionChanged(val));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
