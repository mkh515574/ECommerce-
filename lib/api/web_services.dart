import 'package:dio/dio.dart';
import 'package:ecommerce/api/model/request/login_request_dto.dart';
import 'package:ecommerce/api/model/response/auth_response_dto.dart';
import 'package:retrofit/retrofit.dart';

import 'api_end_points.dart';
import 'model/request/register_request_dto.dart';


part 'web_services.g.dart';


@RestApi()
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;


  @POST(ApiEndPoints.loginApiUrl)
  Future<AuthResponseDto> login(@Body() LoginRequestDto loginRequest);
  @POST(ApiEndPoints.loginApiUrl)
  Future<AuthResponseDto> register(@Body() RegisterRequestDto registerRequest);
}
