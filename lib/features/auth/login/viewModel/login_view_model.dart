import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/core/exceptions/app_exceptions.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/entities/request/login_request.dart';
import '../../../../domain/usecase/login_use_case.dart';
import '../../viewModel/auth_states.dart';

@injectable
class LoginViewModel extends Cubit<AuthStates> {
  LoginUseCase loginUseCase;
  LoginViewModel({required this.loginUseCase}) : super(AuthInitialState());
  var formKey = GlobalKey<FormState>();
  void login(String email, String password) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        final loginRequest = LoginRequest(email: email, password: password);
        final response = await loginUseCase.invoke(loginRequest);
        emit(AuthSuccessState(response));
      } on AppException catch (e) {
        emit(AuthErrorState(exception: e.message));
      } on DioException catch (e) {
        final message = (e.error is AppException)?(e.error as AppException).message :"Unknown Error";
        emit(AuthErrorState(exception: message));
      }
    }
  }
}
