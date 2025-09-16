import 'package:ecommerce/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/domain/entities/request/login_request.dart';

import 'package:ecommerce/domain/entities/request/register_request.dart';

import 'package:ecommerce/domain/entities/response/auth_response.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository{
  AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<AuthResponse> login(LoginRequest loginRequest) {
    // TODO: implement login
    return authRemoteDataSource.login(loginRequest);
  }

  @override
  Future<AuthResponse> register(RegisterRequest registerRequest) {
    // TODO: implement register
    return authRemoteDataSource.register(registerRequest);

  }

}