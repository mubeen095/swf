import 'package:flutter/material.dart';

showDefaultSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      const SnackBar(
        content: Text("Error occurred"),
      ),
    );
}
