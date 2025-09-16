
import '../../domain/entities/request/login_request.dart';
import '../model/request/login_request_dto.dart';


extension LoginRequestMapper on LoginRequest{

  LoginRequestDto toLoginRequestDto(){
    return LoginRequestDto(
      email: email,
      password: password,
    );
  }
}