import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/constants.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/shared_components/choose_file_button.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';

class EducationDetail extends StatefulWidget {
  const EducationDetail({super.key});

  @override
  State<EducationDetail> createState() => _EducationDetailState();
}

class _EducationDetailState extends State<EducationDetail> with FormValidators {
  XFile? image;

  final ImagePicker picker = ImagePicker();

  var dropDownLevel = [
    {"title": "Under SlC", "value": "1"},
    {"title": "Secondary", "value": "2"},
    {"title": "Higher Secondary", "value": "3"},
    {"title": "PHD", "value": "4"},
  ];
  //drop down for gpa and percentage
  String selectedOption = 'Select an Option';
  TextEditingController gpaController = TextEditingController();
  TextEditingController percentageController = TextEditingController();
  TextEditingController schoolCollegeName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Form(
          key: state.eduFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const FormHeadline(title: "Educational Documents"),
                  const Gap(SizeManager.pagePadding),
                  const Text(
                    "Provide your highest educational doucuments",
                  ),
                  const Gap(SizeManager.pagePadding),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    dashPattern: const [5, 5],
                    color: Colors.grey,
                    strokeWidth: 2,
                    child: SizedBox(
                      height: 180,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                      child: state.eduDocPhoto == null
                          ? const Icon(Icons.photo)
                          : Image.file(
                              state.eduDocPhoto!,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  const Gap(SizeManager.pagePadding),
                  ChooseFileButton(onTap: (file) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.eduDocPhotoChanged(file));
                  }),
                  const Gap(SizeManager.pagePadding),
                  SizedBox(
                    height: 50.0,
                    child: DropdownMenu<String?>(
                        expandedInsets: EdgeInsets.zero,
                      inputDecorationTheme: InputDecorationTheme(
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey.shade200))),
                      hintText: "Educational level",
                      onSelected: (val) {
                        if(val==null)return;
                        context
                            .read<UploadDocBloc>()
                            .add(UploadDocEvent.eduLevelChanged(val));
                      },
                      dropdownMenuEntries: dropDownLevel
                          .map((e) => DropdownMenuEntry(
                              value: e["title"], label: e["title"]!))
                          .toList(),
                    ),
                  ),
                  //  const Gap(SizeManager.pagePadding),
                  PrimaryTextField(
                    label: "",
                    validator: validateRequired,
                    onChanged: (val) {
                      context
                          .read<UploadDocBloc>()
                          .add(UploadDocEvent.eduInstituteNameChanged(val));
                    },
                    hintText: 'School/College name',
                  ),

                  PrimaryTextField(
                    label: "",
                    onChanged: (val) {
                      context
                          .read<UploadDocBloc>()
                          .add(UploadDocEvent.eduPassYearChanged(val));
                    },
                    validator: validateRequired,
                    hintText: "Pass year",
                  ),
                ]),
          ),
        );
      },
    );
  }
}
