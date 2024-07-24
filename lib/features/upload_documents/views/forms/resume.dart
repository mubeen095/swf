import 'package:coffee_shop/core/constants/constants.dart';
import 'package:coffee_shop/core/shared_components/choose_file_button.dart';
import 'package:coffee_shop/core/widgets/form_headline.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/language.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';

class CvUpload extends StatefulWidget {
  const CvUpload({super.key});

  @override
  State<CvUpload> createState() => _CvUploadState();
}

class _CvUploadState extends State<CvUpload> {
  XFile? image;

  final ImagePicker picker = ImagePicker();
  Future getImage() async {
    var img = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FormHeadline(title: "Resume Upload"),
              const Gap(SizeManager.pagePadding),
              const Text("Please attach your resume with the latest updates."),
              const Gap(SizeManager.pagePadding),
              DottedBorder(
                color: const Color.fromARGB(255, 83, 83, 83),
                strokeWidth: 1,
                dashPattern: const [5, 5],
                child: Container(
                  height: 120,
                  width: 120,
                  color: const Color.fromARGB(213, 253, 253, 252),
                  child: state.resume == null
                      ? const Icon(Icons.picture_as_pdf)
                      : Image.file(
                          state.resume!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const Gap(SizeManager.pagePadding),
              ChooseFileButton(onTap: (file) {
                context
                    .read<UploadDocBloc>()
                    .add(UploadDocEvent.resumeChanged(file));
              }),
              const Gap(SizeManager.pagePadding),
            ],
          ),
        );
      },
    );
  }
}
