import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/widgets/form_headline.dart';
import 'package:coffee_shop/core/widgets/primary_text_field.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/constants.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm>
    with FormValidators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Define controllers for the TextFormFields
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _permanentAddressController =
      TextEditingController();
  final TextEditingController _temporaryAddressController =
      TextEditingController();

  final TextEditingController _fatherNameController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // PersonalInfo personalInfo = PersonalInfo(
    //   fullName: _fullNameController.text,
    //   permanantAddress: _permanentAddressController.text,
    //   temporaryAddress: _temporaryAddressController.text,
    //   fatherName: _fatherNameController.text,
    //   dob: _dobController.text,
    //   height: double.parse(_height.text.isEmpty?"0.0":_height.text),
    //   weight: double.parse(_weight.text),
    // );

    return BlocBuilder<UploadDocBloc, UploadDocState>(
      builder: (context, state) {
        return Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
          child: Form(
            key: state.personalInfoFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const FormHeadline(title: 'Personal Information'),
                const Gap(16.0),
                PrimaryTextField(
                  label: "Full name",
                  validator: validateRequired,
                  onChanged: (val)=>context.read<UploadDocBloc>().add(UploadDocEvent.fullNameChanged(val)),
                ),
                const Gap(12.0),
                PrimaryTextField(
                  label: "Permanant address",
                  validator: validateRequired,
                      onChanged: (val)=>context.read<UploadDocBloc>().add(UploadDocEvent.permanantAddressChanged(val)),
              
                ),
                const Gap(12.0),
                PrimaryTextField(
                  label: "Temporary address",
                  validator: validateRequired,
                      onChanged: (val)=>context.read<UploadDocBloc>().add(UploadDocEvent.temporaryAddressChanged(val)),
              
                ),
                const Gap(12.0),
                PrimaryTextField(
                  label: "Father's name",
                  validator: validateRequired,
                      onChanged: (val)=>context.read<UploadDocBloc>().add(UploadDocEvent.fatherNameChanged(val)),
              
                ),
                const Gap(12.0),
                PrimaryTextField(
                  label: "Date of birth",
                  validator: validateRequired,
                      onChanged: (val)=>context.read<UploadDocBloc>().add(UploadDocEvent.dobChanged(val)),
              
                ),
                const Gap(16.0),
              ],
            ),
          ),
        );
      },
    );
  }
}
