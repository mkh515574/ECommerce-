import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/exceptions/app_exceptions.dart';
import 'package:ecommerce/domain/entities/request/register_request.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/request/login_request.dart';
import '../../../../domain/usecase/login_use_case.dart';
import '../../../../domain/usecase/register_use_case.dart';
import '../../viewModel/auth_states.dart';

@injectable
class RegisterViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  RegisterViewModel({required this.registerUseCase})
    : super(AuthInitialState());
  var formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController(
    text: "ali dekheel",
  );
  TextEditingController phoneController = TextEditingController(
    text: "01100860890",
  );
  TextEditingController mailController = TextEditingController(
    text: "adasdf@fds.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "15261548@A",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "15261548@A",
  );

  void register() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        final registerRequest = RegisterRequest(
          email: mailController.text,
          password: passwordController.text,
          rePassword: rePasswordController.text,
          name: fullNameController.text,
          phone: phoneController.text,
        );
        final response = await registerUseCase.invoke(registerRequest);
        emit(AuthSuccessState(response));
      } on AppException catch (e) {
        emit(AuthErrorState(exception: e.message));
      } on DioException catch (e) {
        final message = (e.error is AppException)
            ? (e.error as AppException).message
            : "Unknown Error";
        emit(AuthErrorState(exception: message));
      }
    }
  }
}
