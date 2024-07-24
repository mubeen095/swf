import 'package:coffee_shop/core/config/colors.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import "package:flutter/material.dart";

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    background: AppColors.white,
    onBackground: AppColors.textColor,
    surface: AppColors.white,
    onSurface: AppColors.textColor,
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.white)),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeManager.curveValue),
        borderSide: const BorderSide(color: Colors.grey)),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeManager.curveValue),
        borderSide: const BorderSide(color: Colors.grey)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeManager.curveValue),
        borderSide: const BorderSide(color: Colors.grey)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(SizeManager.curveValue),
        borderSide: const BorderSide(color: Colors.red)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(1.0),
        minimumSize: const MaterialStatePropertyAll(
            Size(double.maxFinite, SizeManager.buttonHeight)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SizeManager.curveValue),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return Colors.grey;
          }
          return AppColors.secondary;
        }),
        foregroundColor: const MaterialStatePropertyAll(AppColors.white)),
  ),
);
