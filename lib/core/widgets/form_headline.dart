import 'package:flutter/material.dart';

class FormHeadline extends StatelessWidget {
  const FormHeadline({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context).textTheme;
    return Text(
            title,
            style: theme.headlineSmall,
          );
  }
}