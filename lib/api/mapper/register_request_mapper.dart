import 'package:ecommerce/domain/entities/request/register_request.dart';

import '../model/request/register_request_dto.dart';

extension RegisterRequestMapper on RegisterRequest{

  RegisterRequestDto toRegisterRequestDto(){
    return RegisterRequestDto(
      name: name,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }

}