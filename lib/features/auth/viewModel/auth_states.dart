import '../../../domain/entities/response/auth_response.dart';

abstract class AuthStates{}

class AuthInitialState extends AuthStates{}
class AuthLoadingState extends AuthStates{}
class AuthSuccessState extends AuthStates{
  final AuthResponse authResponse;
  AuthSuccessState(this.authResponse);
}
class AuthErrorState extends AuthStates{

  String exception;
  AuthErrorState({required this.exception});
}