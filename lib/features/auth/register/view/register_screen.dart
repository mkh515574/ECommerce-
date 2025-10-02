import 'package:ecommerce/features/auth/register/viewModel/register_view_model.dart';
import 'package:ecommerce/features/auth/viewModel/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/di/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialog_utils.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterViewModel registerViewModel = getIt<RegisterViewModel>();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterViewModel, AuthStates>(
      bloc: registerViewModel,
      listener: (context, state) {
        if (state is AuthLoadingState) {
          DialogUtils.showLoading(context: context, message: "Waiting ...");
        } else if (state is AuthErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            message: state.exception,
            title: "Error",
            posActionName: "Ok",
          );
        } else if (state is AuthSuccessState) {
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(
            context: context,
            message: "Register Successfully",
            title: "Success",
            posActionName: "Ok",
            posAction: () {
              Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
            },
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 91.h,
                  bottom: 10.h,
                  left: 97.w,
                  right: 97.w,
                ),
                child: Image.asset(AppAssets.appBarLeading),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Form(
                        key: registerViewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("Full Name", style: AppStyles.medium18White),
                            CustomTextFormField(
                              //isPassword: false,
                              keyboardType: TextInputType.name,
                              obscureText: false,
                              hintText: "enter your full name",
                              hintStyle: AppStyles.light18HintText,
                              fillColor: AppColors.whiteColor,
                              controller: registerViewModel.fullNameController,
                              validator: AppValidators.validateFullName,
                            ),
                            Text(
                              "Mobile Number",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              // isPassword: false,
                              keyboardType: TextInputType.phone,
                              obscureText: false,
                              hintText: "enter your mobile number",
                              hintStyle: AppStyles.light18HintText,
                              fillColor: AppColors.whiteColor,
                              controller: registerViewModel.phoneController,
                              validator: AppValidators.validatePhoneNumber,
                            ),
                            Text(
                              "E-mail address",
                              style: AppStyles.medium18White,
                            ),
                            CustomTextFormField(
                              //isPassword: false,
                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              hintText: "enter your email address",
                              hintStyle: AppStyles.light18HintText,
                              fillColor: AppColors.whiteColor,
                              controller: registerViewModel.mailController,
                              validator: AppValidators.validateEmail,
                            ),
                            Text("Password", style: AppStyles.medium18White),
                            CustomTextFormField(
                              // isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              hintText: "enter your password",
                              hintStyle: AppStyles.light18HintText,
                              fillColor: AppColors.whiteColor,
                              controller: registerViewModel.passwordController,
                              validator: AppValidators.validatePassword,
                            ),
                            Text("RePassword", style: AppStyles.medium18White),
                            CustomTextFormField(
                              //isPassword: true,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              hintText: "enter your password again",
                              hintStyle: AppStyles.light18HintText,
                              fillColor: AppColors.whiteColor,
                              controller:
                                  registerViewModel.rePasswordController,
                              validator: (value) {
                                return AppValidators.validateConfirmPassword(
                                  value,
                                  registerViewModel.passwordController.text,
                                );
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 35.h),
                              child: CustomElevatedButton(
                                backgroundColor: AppColors.whiteColor,
                                textStyle: AppStyles.semi20Primary,
                                text: "Sign up",
                                onPressed: () {
                                  registerViewModel.register();
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.loginRoute,
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        'Already have an account? login',
                                        style: AppStyles.medium18White,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
