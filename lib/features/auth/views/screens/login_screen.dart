import 'package:coffee_shop/core/config/routing.dart';
import 'package:coffee_shop/core/extensions/context_extension.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:coffee_shop/core/widgets/primary_text_field.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/auth/blocs/login_bloc/login_bloc.dart';
import 'package:coffee_shop/features/upload_documents/views/upload_document_screen.dart';

import 'package:coffee_shop/features/auth/views/screens/signup_screen.dart';
import 'package:coffee_shop/src/landing_screen.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/config/colors.dart';
import '../../../../core/constants/size_manager.dart';

class LoginScreen extends StatelessWidget with FormValidators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt.get<LoginBloc>(),
      child: Builder(builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.primary,
          appBar: AppBar(),
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
              } else if (state is LoginFailure) {
                showDefaultSnackBar(context);
              } else if (state is LoginSuccess) {
                context.go(AppRoutes.uploadDocRoute);
              } else {}
            },
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height * 0.10,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeManager.pagePadding),
                      child: Text(
                        "Login",
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
                          PrimaryTextField(
                            controller: _numberController,
                            validator: validateMobileNumber,
                            label: "Mobile number",
                            keyboardType: TextInputType.phone,
                          ),
                          const Gap(12.0),
                          PrimaryTextField(
                            controller: _passwordController,
                            validator: validatePassword,
                            label: "Password",
                            obscure: true,
                          ),
                          const Gap(12.0),
                          BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginLoading) {
                                return const Center(child:  CircularProgressIndicator());
                              } else {
                                return ElevatedButton(
                                    onPressed: () {
                                      if(!_formKey.currentState!.validate())return;
                                      context.hideKeyboard();
                                      context.read<LoginBloc>().add(LoginEvent(
                                          mobileNumber: _numberController.text,
                                          password: _passwordController.text));
                                    },
                                    child: const Text("Log In"));
                              }
                            },
                          ),
                          const Gap(12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Dont't have a account?",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              InkWell(
                                onTap: () {
                                  context.go(AppRoutes.signupRoute);
                                },
                                child: Center(
                                  child: Text(
                                    ' Sign up',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge
                                        ?.copyWith(color: AppColors.primary),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(12.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
