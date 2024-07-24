import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/workExperience.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class BankDetail extends StatefulWidget {
  BankDetail({super.key});

  @override
  State<BankDetail> createState() => _BankDetailState();
}

class _BankDetailState extends State<BankDetail> with FormValidators {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Form(
          key: state.bankDetailFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FormHeadline(title: "Bank Details"),
                const Gap(SizeManager.pagePadding),
                const Text('Please provide your bank details'),
                const Gap(12.0),
                PrimaryTextField(
                  label: "Bank name",
                  validator: validateRequired,
                  onChanged: (val) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.bankNameChanged(val));
                  },
                ),
                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Branch",
                  validator: validateRequired,
                  onChanged: (val) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.bankBranchChanged(val));
                  },
                ),
                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Account holder's name",
                  validator: validateRequired,
                  onChanged: (val) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.bankAcHoldersNameChanged(val));
                  },
                ),
                const Gap(SizeManager.pagePadding),
                PrimaryTextField(
                  label: "Account number",
                  validator: validateRequired,
                  onChanged: (val) {
                    context
                        .read<UploadDocBloc>()
                        .add(UploadDocEvent.bankAcNumberChanged(val));
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
