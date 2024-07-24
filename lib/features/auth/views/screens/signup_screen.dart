import 'package:coffee_shop/core/config/config.dart';
import 'package:coffee_shop/core/constants/size_manager.dart';
import 'package:coffee_shop/core/extensions/context_extension.dart';
import 'package:coffee_shop/core/helpers/helpers.dart';
import 'package:coffee_shop/core/utils/utils.dart';
import 'package:coffee_shop/core/widgets/widgets.dart';
import 'package:coffee_shop/dependency_injection.dart';
import 'package:coffee_shop/features/auth/blocs/signup_bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with FormValidators {
  late double height, width;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt.get<SignupBloc>(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(),
        body: BlocConsumer<SignupBloc, SignupState>(
          listener: (BuildContext context, SignupState state) {
            //TODO:handle other states
            if (state.status == SignupStatus.requestSignupLoading) {
              print('loading');
            } else if (state.status == SignupStatus.requestSignupError) {
              print('error ..');
              showDefaultSnackBar(context);
            } else if (state.status == SignupStatus.requestSignupSuccess) {
              context.push(AppRoutes.otpRoute);
            } else {
              print('else');
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: height * 0.10,
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.symmetric(
                          horizontal: SizeManager.pagePadding),
                      child: Text(
                        "Create your account",
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
                        children: [
                          const Gap(12.0),
                          Container(
                              alignment: Alignment.topLeft,
                              height: 85,
                              width: 300,
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
                              obscure: true,
                              label: "Password"),
                          const Gap(12.0),
                          PrimaryTextField(
                              controller: _confirmpasswordController,
                              validator: (confirmPassword)=>validateConfirmPassword(_passwordController.text,confirmPassword),
                              obscure: true,
                              label: "Confirm password"),
                          const Gap(12.0),

                          state.status == SignupStatus.requestSignupLoading
                              ? const Center(child:  CircularProgressIndicator())
                              : ElevatedButton(
                                  onPressed: () {
                                    if(!_formKey.currentState!.validate())return;
                                    context.hideKeyboard();
                                    BlocProvider.of<SignupBloc>(context).add(
                                        RequestSignup(
                                            mobileNo: _numberController.text,
                                            password: _passwordController.text,
                                            confirmPassword:
                                                _confirmpasswordController
                                                    .text));
                                  },
                                  child: const Text("Sign Up")),
                          const Gap(12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already has account?",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                              InkWell(
                                onTap: () {
                                  context.go(AppRoutes.loginRoute);
                                },
                                child: Center(
                                  child: Text(
                                    ' Login',
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
            );
          },
        ),
      ),
    );
  }
}
