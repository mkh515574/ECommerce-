import 'package:ecommerce/api/mapper/user_mapper.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:ecommerce/domain/entities/response/auth_response.dart';

import '../../core/exceptions/app_exceptions.dart';

extension AuthResponseMapper on AuthResponseDto{

  AuthResponse toAuthResponse(){
    if(user != null && token!.isNotEmpty && token != null){
      return AuthResponse(
        message: message,
        user: user?.toUser(),
        token: token);
    }

    throw ServerException(message: "Failed to login", statusCode: null);
  }
}