import 'package:ecommerce/api/mapper/auth_response_mapper.dart';
import 'package:ecommerce/api/mapper/login_request_mapper.dart';
import 'package:ecommerce/api/mapper/register_request_mapper.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';

import 'package:ecommerce/domain/entities/request/register_request.dart';

import 'package:ecommerce/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

import '../../../data/data_sources/remote/auth_remote_data_source.dart';
import '../../web_services.dart';

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource{
  WebServices webServices;
  AuthRemoteDataSourceImpl({required this.webServices});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) async {


    var authResponse = await webServices.login(loginRequest.toLoginRequestDto());
    return authResponse.toAuthResponse();
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) async{
    // TODO: implement register
    var authResponse = await webServices.register(registerRequest.toRegisterRequestDto());
    return authResponse.toAuthResponse();
  }

}