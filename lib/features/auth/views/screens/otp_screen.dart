import 'package:coffee_shop/core/config/routing.dart';
import 'package:coffee_shop/core/utils/snackbar.dart';
import 'package:coffee_shop/core/widgets/primary_text_field.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/auth/blocs/signup_bloc/signup_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/upload_document_screen.dart';

import 'package:coffee_shop/features/auth/views/screens/signup_screen.dart';
import 'package:coffee_shop/src/landing_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/constants/size_manager.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  ValueNotifier<String> otp = ValueNotifier<String>('');

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt.get<SignupBloc>(),
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          if (state.status == SignupStatus.verifyOTPError) {
            showDefaultSnackBar(context);
          } else if (state.status == SignupStatus.verifyOTPSuccess) {
            context.go(AppRoutes.loginRoute);
          } else {
            return;
          }
        },
        child: Builder(builder: (context) {
          return Scaffold(
            backgroundColor: AppColors.primary,
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height * 0.10,
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.symmetric(
                        horizontal: SizeManager.pagePadding),
                    child: Text(
                      "Verify Your OTP",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: AppColors.white),
                    ),
                  ),
                  const Gap(12.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: SizeManager.pagePadding),
                    margin: const EdgeInsets.symmetric(
                        horizontal: SizeManager.pagePadding),
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.all(
                          Radius.circular(SizeManager.curveValue)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Gap(12.0),
                        Container(
                            alignment: Alignment.centerLeft,
                            height: 100,
                            width: 250,
                            child: Image.asset('assets/images/ditya.jpg')),
                        const Gap(24.0),
                        const Text(
                            "We've sent 4 digit verification code. Please verify."),
                        const Gap(24.0),
                        OtpPinField(
                          key: _otpPinFieldController,
                          autoFillEnable: false,
                          onChange: (text) {
                            print('Enter on change pin is $text');
                            otp.value = text;
                          },
                          onSubmit: (otp) {},
                        ),
                        const Gap(24.0),
                        BlocBuilder<SignupBloc, SignupState>(
                          builder: (context, state) {
                            if(state.status==SignupStatus.verifyOTPLoading){
                              return const Center(child: CircularProgressIndicator());
                            }
                            return ValueListenableBuilder(
                                valueListenable: otp,
                                builder: (context, value, child) {
                                  return ElevatedButton(
                                      onPressed: otp.value.length < 4
                                          ? null
                                          : () {
                                              print(otp.value);
                                              context.read<SignupBloc>().add(
                                                  VerifyOTP(
                                                      otpCode: otp.value));
                                            },
                                      child: const Text("Verify"));
                                });
                          },
                        ),
                        const Gap(12.0),
                        const Gap(12.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
