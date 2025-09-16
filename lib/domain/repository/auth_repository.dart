import 'package:ecommerce/domain/entities/request/login_request.dart';
import 'package:ecommerce/domain/entities/response/auth_response.dart';

import '../entities/request/register_request.dart';


abstract class AuthRepository{

  Future<AuthResponse> login(LoginRequest loginRequest);
  Future<AuthResponse> register(RegisterRequest registerRequest);

}