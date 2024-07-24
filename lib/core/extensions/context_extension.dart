import 'package:flutter/material.dart';

extension ContextExtension on BuildContext{
  void hideKeyboard(){
    FocusScope.of(this).unfocus();
  }
}