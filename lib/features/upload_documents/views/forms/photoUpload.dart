import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/shared_components/choose_file_button.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/passportUpload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:im_stepper/stepper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:google_fonts/google_fonts.dart';

class PhotoUpload extends StatefulWidget {
  PhotoUpload({
    super.key,
  });

  @override
  State<PhotoUpload> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PhotoUpload> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const FormHeadline(title: "Photo Upload"),
              const Gap(SizeManager.pagePadding),
              const Text(
                "Please upload passpost size(2 inch x 2 inch or 51 mm x 51 mm) photo",
                textAlign: TextAlign.start,
              ),
              const Gap(SizeManager.pagePadding),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [5, 5],
                color: Colors.grey,
                strokeWidth: 2,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  child: state.ppSizePhoto == null
                      ? const Icon(Icons.photo)
                      : Image.file(
                          state.ppSizePhoto!,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const Gap(SizeManager.pagePadding),

              ChooseFileButton(onTap: (file) {
                context
                    .read<UploadDocBloc>()
                    .add(UploadDocEvent.ppSizePhotoChanged(file));
              }),
              const Gap(24.0),

              const Text(
                "Please upload full size photo where your entire body is visible.",
                textAlign: TextAlign.start,
              ),
              const Gap(16.0),
              DottedBorder(
                borderType: BorderType.RRect,
                dashPattern: const [10, 10],
                color: Colors.grey,
                strokeWidth: 2,
                child: SizedBox(
                  height: 120,
                  width: 120,
                  // child: Image.asset("assets/images/defaultImage.jpg"),
                  child: state.fullSizePhoto == null
                      ? const Icon(Icons.photo)
                      : Image.file(state.fullSizePhoto!,fit:BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ChooseFileButton(onTap: (file) {
                context
                    .read<UploadDocBloc>()
                    .add(UploadDocEvent.fullSizePhotoChanged(file));
              }),

              const Gap(SizeManager.pagePadding),
            ],
          ),
        );
      },
    );
  }
}
