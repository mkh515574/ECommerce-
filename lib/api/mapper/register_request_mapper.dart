import 'package:ecommerce/api/model/request/register_request_dto.dart';
import 'package:ecommerce/domain/entities/request/register_request.dart';

extension RegisterRequestMapper on RegisterRequest{
  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      password: password,
      email: email,
      rePassword:rePassword ,
      phone: phone,
      name: name
    );
  }
}