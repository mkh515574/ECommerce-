// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../../api/data_sources/remote/auth_remote_data_source_impl.dart'
    as _i527;
import '../../../api/dio/dio_module.dart' as _i967;
import '../../../api/web_services.dart' as _i1072;
import '../../../data/data_sources/remote/auth_remote_data_source.dart'
    as _i930;
import '../../../data/repository/auth_repository_impl.dart' as _i655;
import '../../../domain/repository/auth_repository.dart' as _i473;
import '../../../domain/usecase/login_use_case.dart' as _i876;
import '../../../domain/usecase/register_use_case.dart' as _i714;
import '../../../features/auth/login/viewModel/login_view_model.dart' as _i1036;
import '../../../features/auth/register/viewModel/register_view_model.dart'
    as _i897;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i1072.WebServices>(
      () => getItModule.provideWebServices(gh<_i361.Dio>()),
    );
    gh.factory<_i930.AuthRemoteDataSource>(
      () =>
          _i527.AuthRemoteDataSourceImpl(webServices: gh<_i1072.WebServices>()),
    );
    gh.factory<_i473.AuthRepository>(
      () => _i655.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i930.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i876.LoginUseCase>(
      () => _i876.LoginUseCase(authRepository: gh<_i473.AuthRepository>()),
    );
    gh.factory<_i714.RegisterUseCase>(
      () => _i714.RegisterUseCase(authRepository: gh<_i473.AuthRepository>()),
    );
    gh.factory<_i897.RegisterViewModel>(
      () =>
          _i897.RegisterViewModel(registerUseCase: gh<_i714.RegisterUseCase>()),
    );
    gh.factory<_i1036.LoginViewModel>(
      () => _i1036.LoginViewModel(loginUseCase: gh<_i876.LoginUseCase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i967.GetItModule {}
