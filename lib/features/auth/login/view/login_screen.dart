import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce/core/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/di/di.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_routes.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../viewModel/auth_states.dart';
import '../viewModel/login_view_model.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginViewModel loginViewModel = getIt<LoginViewModel>();
  TextEditingController userNameController = TextEditingController(
    text: "adasdfvv@fds.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "18061717@A",
  );


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginViewModel, AuthStates>(
      bloc: loginViewModel,
      listener: (context, state) {
        // TODO: implement listener

        if(state is AuthLoadingState){
         DialogUtils.showLoading(context: context, message: "Waiting ...");
        }else if(state is AuthErrorState){
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(context: context, message: state.exception,title: "Error",posActionName: "Ok");
        }else if(state is AuthSuccessState){
          DialogUtils.hideLoading(context);

          DialogUtils.showMessage(context: context, message: "Login Successfully",title: "Success",posActionName: "Ok",posAction: (){
            Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 91.h,
                    bottom: 87.h,
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
                      AutoSizeText(
                        'Welcome Back To Route',
                        style: AppStyles.semi24White,
                        maxLines: 1,
                      ),
                      AutoSizeText(
                        'Please sign in with your mail',
                        style: AppStyles.light16White,
                        maxLines: 1,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.h),
                        child: Form(
                          key: loginViewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text("User Name", style: AppStyles.medium18White),
                              SizedBox(height: 16.h),

                              CustomTextFormField(
                                //isPassword: false,
                                keyboardType: TextInputType.text,
                                obscureText: false,
                                hintText: "enter your name",
                                hintStyle: AppStyles.light18HintText,
                                fillColor: AppColors.whiteColor,
                                controller: userNameController,
                                validator: AppValidators.validateEmail,
                              ),
                              SizedBox(height: 16.h),
                              Text("Password", style: AppStyles.medium18White),
                              SizedBox(height: 16.h),

                              CustomTextFormField(
                                // isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                hintText: "enter your password",
                                hintStyle: AppStyles.light18HintText,
                                fillColor: AppColors.whiteColor,
                                controller: passwordController,
                                validator: AppValidators.validatePassword,
                                suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.visibility_off),
                                ),
                              ),
                              SizedBox(height: 16.h),

                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'Forgot Password',
                                  style: AppStyles.regular18White,
                                  textAlign: TextAlign.end,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 35.h),
                                child: CustomElevatedButton(
                                  backgroundColor: AppColors.whiteColor,
                                  textStyle: AppStyles.semi20Primary,
                                  text: "Login",
                                  onPressed: () {
                                    loginViewModel.login(userNameController.text, passwordController.text);
                                  },
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 30.h),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                      context,
                                      AppRoutes.registerRoute,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Don’t have an account? Create Account',
                                          style: AppStyles.medium18White,
                                          textAlign: TextAlign.center,
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
      ),
    );
  }
}
