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
import '../../../api/data_sources/remote/brand_remote_data_source_impl.dart'
    as _i624;
import '../../../api/data_sources/remote/cart_remote_data_source_impl.dart'
    as _i917;
import '../../../api/data_sources/remote/category_remote_data_source_impl.dart'
    as _i838;
import '../../../api/data_sources/remote/favourites_remote_data_source_impl.dart'
    as _i742;
import '../../../api/data_sources/remote/product_remote_data_source_impl.dart'
    as _i322;
import '../../../api/dio/dio_module.dart' as _i967;
import '../../../api/web_services.dart' as _i1072;
import '../../../data/data_sources/remote/auth_remote_data_source.dart'
    as _i930;
import '../../../data/data_sources/remote/brand_remote_data_source.dart'
    as _i94;
import '../../../data/data_sources/remote/cart_remote_data_source.dart'
    as _i419;
import '../../../data/data_sources/remote/category_remote_data_source.dart'
    as _i540;
import '../../../data/data_sources/remote/favourites_remote_data_source.dart'
    as _i821;
import '../../../data/data_sources/remote/product_remote_data_source.dart'
    as _i869;
import '../../../data/repositories/auth_repository_impl.dart' as _i716;
import '../../../data/repositories/brand_repository_impl.dart' as _i508;
import '../../../data/repositories/cart_repository_impl.dart' as _i333;
import '../../../data/repositories/category_repository_impl.dart' as _i604;
import '../../../data/repositories/favourites_repository_impl.dart' as _i810;
import '../../../data/repositories/product_repository_impl.dart' as _i74;
import '../../../domain/repositories/auth_repository.dart' as _i801;
import '../../../domain/repositories/brands/brand_repository.dart' as _i804;
import '../../../domain/repositories/cart/cart_repository.dart' as _i820;
import '../../../domain/repositories/category/category_repository.dart'
    as _i676;
import '../../../domain/repositories/favourites/favourites_repository.dart'
    as _i3;
import '../../../domain/repositories/products/product_repository.dart'
    as _i1010;
import '../../../domain/use_cases/add_to_cart_use_case.dart' as _i451;
import '../../../domain/use_cases/add_to_wishlist_use_case.dart' as _i537;
import '../../../domain/use_cases/delete_items_in_cart_use_case.dart' as _i922;
import '../../../domain/use_cases/delete_items_in_wishlist_use_case.dart'
    as _i40;
import '../../../domain/use_cases/get_all_brands_use_case.dart' as _i887;
import '../../../domain/use_cases/get_all_categories_use_case.dart' as _i65;
import '../../../domain/use_cases/get_all_products_use_case.dart' as _i326;
import '../../../domain/use_cases/get_items_cart_use_case.dart' as _i335;
import '../../../domain/use_cases/get_items_wishlist_use_case.dart' as _i69;
import '../../../domain/use_cases/login_use_case.dart' as _i798;
import '../../../domain/use_cases/register_use_case.dart' as _i311;
import '../../../domain/use_cases/update_count_in_cart_use_case.dart' as _i952;
import '../../../features/auth/login/viewModel/login_view_model.dart' as _i1036;
import '../../../features/auth/register/viewModel/register_view_model.dart'
    as _i897;
import '../../../features/cart/viewModel/cart_view_model.dart' as _i438;
import '../../../features/category/viewModel/product_view_model.dart' as _i774;
import '../../../features/favourites/viewModel/favourites_view_model.dart'
    as _i857;
import '../../../features/home/viewModel/home_view_model.dart' as _i1037;

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
    gh.factory<_i869.ProductRemoteDataSource>(
      () => _i322.ProductRemoteDataSourceImpl(
        webServices: gh<_i1072.WebServices>(),
      ),
    );
    gh.factory<_i930.AuthRemoteDataSource>(
      () =>
          _i527.AuthRemoteDataSourceImpl(webServices: gh<_i1072.WebServices>()),
    );
    gh.factory<_i540.CategoryRemoteDataSource>(
      () => _i838.CategoryRemoteDataSourceImpl(
        webServices: gh<_i1072.WebServices>(),
      ),
    );
    gh.factory<_i676.CategoryRepository>(
      () => _i604.CategoryRepositoryImpl(
        remoteDataSource: gh<_i540.CategoryRemoteDataSource>(),
      ),
    );
    gh.factory<_i65.GetAllCategoriesUseCase>(
      () => _i65.GetAllCategoriesUseCase(
        categoryRepository: gh<_i676.CategoryRepository>(),
      ),
    );
    gh.factory<_i1010.ProductRepository>(
      () => _i74.ProductRepositoryImpl(
        remoteDataSource: gh<_i869.ProductRemoteDataSource>(),
      ),
    );
    gh.factory<_i801.AuthRepository>(
      () => _i716.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i930.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i419.CartRemoteDataSource>(
      () =>
          _i917.CartRemoteDataSourceImpl(webServices: gh<_i1072.WebServices>()),
    );
    gh.factory<_i820.CartRepository>(
      () => _i333.CartRepositoryImpl(
        remoteDataSource: gh<_i419.CartRemoteDataSource>(),
      ),
    );
    gh.factory<_i821.FavouritesRemoteDataSource>(
      () =>
          _i742.CartRemoteDataSourceImpl(webServices: gh<_i1072.WebServices>()),
    );
    gh.factory<_i94.BrandRemoteDataSource>(
      () => _i624.BrandRemoteDataSourceImpl(
        webServices: gh<_i1072.WebServices>(),
      ),
    );
    gh.factory<_i326.GetAllProductsUseCase>(
      () => _i326.GetAllProductsUseCase(
        productRepository: gh<_i1010.ProductRepository>(),
      ),
    );
    gh.factory<_i3.FavouritesRepository>(
      () => _i810.FavouritesRepositoryImpl(
        remoteDataSource: gh<_i821.FavouritesRemoteDataSource>(),
      ),
    );
    gh.factory<_i798.LoginUseCase>(
      () => _i798.LoginUseCase(authRepository: gh<_i801.AuthRepository>()),
    );
    gh.factory<_i311.RegisterUseCase>(
      () => _i311.RegisterUseCase(authRepository: gh<_i801.AuthRepository>()),
    );
    gh.factory<_i451.AddToCartUseCase>(
      () => _i451.AddToCartUseCase(cartRepository: gh<_i820.CartRepository>()),
    );
    gh.factory<_i922.DeleteItemsInCartUseCase>(
      () => _i922.DeleteItemsInCartUseCase(
        cartRepository: gh<_i820.CartRepository>(),
      ),
    );
    gh.factory<_i335.GetItemsCartUseCase>(
      () =>
          _i335.GetItemsCartUseCase(cartRepository: gh<_i820.CartRepository>()),
    );
    gh.factory<_i952.UpdateCountInCartUseCase>(
      () => _i952.UpdateCountInCartUseCase(
        cartRepository: gh<_i820.CartRepository>(),
      ),
    );
    gh.factory<_i40.DeleteItemsInWishlistUseCase>(
      () => _i40.DeleteItemsInWishlistUseCase(
        cartRepository: gh<_i3.FavouritesRepository>(),
      ),
    );
    gh.factory<_i804.BrandRepository>(
      () => _i508.BrandRepositoryImpl(
        remoteDataSource: gh<_i94.BrandRemoteDataSource>(),
      ),
    );
    gh.factory<_i438.CartViewModel>(
      () => _i438.CartViewModel(
        addToCartUseCase: gh<_i451.AddToCartUseCase>(),
        getItemsCartUseCase: gh<_i335.GetItemsCartUseCase>(),
        deleteItemsInCartUseCase: gh<_i922.DeleteItemsInCartUseCase>(),
        updateCountInCartUseCase: gh<_i952.UpdateCountInCartUseCase>(),
      ),
    );
    gh.factory<_i774.ProductViewModel>(
      () => _i774.ProductViewModel(
        getAllProductsUseCase: gh<_i326.GetAllProductsUseCase>(),
      ),
    );
    gh.factory<_i1036.LoginViewModel>(
      () => _i1036.LoginViewModel(loginUseCase: gh<_i798.LoginUseCase>()),
    );
    gh.factory<_i537.AddToWishlistUseCase>(
      () => _i537.AddToWishlistUseCase(
        favouritesRepository: gh<_i3.FavouritesRepository>(),
      ),
    );
    gh.factory<_i69.GetItemsWishlistUseCase>(
      () => _i69.GetItemsWishlistUseCase(
        favouritesRepository: gh<_i3.FavouritesRepository>(),
      ),
    );
    gh.factory<_i887.GetAllBrandsUseCase>(
      () => _i887.GetAllBrandsUseCase(
        brandRepository: gh<_i804.BrandRepository>(),
      ),
    );
    gh.factory<_i897.RegisterViewModel>(
      () =>
          _i897.RegisterViewModel(registerUseCase: gh<_i311.RegisterUseCase>()),
    );
    gh.factory<_i1037.HomeViewModel>(
      () => _i1037.HomeViewModel(
        getAllCategoryUseCase: gh<_i65.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i887.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i857.FavouritesViewModel>(
      () => _i857.FavouritesViewModel(
        addToWishlistUseCase: gh<_i537.AddToWishlistUseCase>(),
        getItemsWishlistUseCase: gh<_i69.GetItemsWishlistUseCase>(),
        deleteItemsInCartUseCase: gh<_i40.DeleteItemsInWishlistUseCase>(),
        updateCountInCartUseCase: gh<_i952.UpdateCountInCartUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i967.GetItModule {}
