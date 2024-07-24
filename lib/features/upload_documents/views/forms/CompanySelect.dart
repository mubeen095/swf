import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/features/upload_documents/bloc/upload_doc_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/forms/bankDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:im_stepper/stepper.dart';

class CompanySelect extends StatefulWidget {
  int active_index = 5;
  CompanySelect({super.key, required this.active_index});

  @override
  State<CompanySelect> createState() => _CompanySelectState();
}

class _CompanySelectState extends State<CompanySelect> {
  var dropDownListData = [
    "Information Technology(IT)",
    "Engineering",
    "Production",
    "Manufacturing",
    "Labor",
    "Other",
  ];
  String delaultValue = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: SizeManager.pagePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FormHeadline(title: "Company selection"),
          const Gap(SizeManager.pagePadding),
          const Text(
              'What category of companies are you looking for?. You can select multiple categories.'),
          // const Gap(SizeManager.pagePadding),
          // DropdownMenu<String>(
          //   label: const Text('Company categories'),
          //   expandedInsets: EdgeInsets.zero,
          //   onSelected: (val) {
          //     if (val == null) return;
          //     context
          //         .read<UploadDocBloc>()
          //         .add(UploadDocEvent.companyCategoryChanged(val));
          //   },
          //   dropdownMenuEntries:
          //       dropDownListData.map<DropdownMenuEntry<String>>((String val) {
          //     return DropdownMenuEntry<String>(
          //       value: val,
          //       label: val,
          //     );
          //   }).toList(),
          // ),

          const Gap(SizeManager.pagePadding),
          Text("Categories:",
              style: Theme.of(context).textTheme.bodyLarge),
          const Gap(8.0),
          BlocBuilder<UploadDocBloc, UploadDocState>(
            builder: (context, state) {
              return Wrap(
                spacing: 10.0,
                children: dropDownListData
                    .map((e) => InkWell(
                          onTap: () {
                            context
                                .read<UploadDocBloc>()
                                .add(UploadDocEvent.companyCategoryChanged(e));
                          },
                          child: Chip(
                            avatar: state.companyCategories.contains(e)
                                ? Icon(
                                    Icons.check_circle,
                                    color: AppColors.secondary,
                                  )
                                : null,
                            label: Text(e),
                            // deleteIcon: const Icon(Icons.clear),
                            // onDeleted: () {},
                          ),
                        ))
                    .toList(),
              );
            },
          )
        ],
      ),
    );
  }
}
