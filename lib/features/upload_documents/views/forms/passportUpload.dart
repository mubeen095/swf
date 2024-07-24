import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/shared_components/shared_components.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/constants.dart';

class PassportUpload extends StatefulWidget {
  const PassportUpload({super.key});

  @override
  State<PassportUpload> createState() => _PassportUploadState();
}

class _PassportUploadState extends State<PassportUpload> with FormValidators {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Form(
          key: state.passportFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FormHeadline(title: "Passport Upload"),
                const Gap(SizeManager.pagePadding),
                DottedBorder(
                  borderType: BorderType.RRect,
                  dashPattern: const [5, 5],
                  color: Colors.grey,
                  strokeWidth: 2,
                  child: SizedBox(
                    height: 120.0,
                    width: 120.0,
                    child: state.passportPhoto == null
                        ? Icon(Icons.photo)
                        : Image.file(state.passportPhoto!, fit: BoxFit.cover),
                  ),
                ),
                const Gap(16.0),
                ChooseFileButton(
                  onTap: (file) {
                    print(file);
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.passportPhotoChanged(file));
                  },
                ),
                PrimaryTextField(
                    validator: validateRequired,
                    onChanged: (val) {
                      context
                          .read<UploadDocBloc>()
                          .add(UploadDocEvent.passportNumberChanged(val));
                    },
                    label: "Passport Number"),
                const Gap(12.0),
                PrimaryTextField(
                  onChanged: (val) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.passportIssueDateChanged(val));
                  },
                  label: "Issue date",
                  validator: validateRequired,
                ),
                const Gap(12.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
