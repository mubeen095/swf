import 'dart:io';

import 'package:coffee_shop/core/config/config.dart';
import 'package:coffee_shop/core/constants/constants.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:flutter/material.dart';

class ChooseFileButton extends StatelessWidget {
  const ChooseFileButton({
    super.key,
    required this.onTap,
  });
  final Function(dynamic file) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      onTap: () async {
        final result = await filePickerHelper();
        if (result == null) return;

        onTap(result);

        // onTap("hello");
      },
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(50),
        child: Container(
          // clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.secondary,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text("Choose File",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.white)),
          ),
        ),
      ),
    );
  }
}
