import 'package:dio/dio.dart';
import 'package:ecommerce/api/api_end_points.dart';
import 'package:ecommerce/api/web_services.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'dio_interceptors.dart';

@module
abstract class GetItModule {
  @singleton
  BaseOptions provideBaseOptions() {
    return BaseOptions(
      baseUrl: ApiEndPoints.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );
  }

  @singleton
  PrettyDioLogger providePrettyDioLogger() {
    return PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );
  }

  @singleton
  Dio provideDio(
      BaseOptions baseOptions,
      PrettyDioLogger prettyDioLogger,
      ) {
    final dio = Dio(baseOptions);
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(prettyDioLogger);
    return dio;
  }

  @singleton
  WebServices provideWebServices(Dio dio) {
    return WebServices(dio);
  }
}
