import 'package:ecommerce/domain/usecase/add_to_wish_list_use_case.dart';
import 'package:ecommerce/domain/usecase/get_all_wish_list_use_case.dart';
import 'package:ecommerce/domain/usecase/remove_item_wish_list_use_case.dart';
import 'package:ecommerce/features/favourites/viewModel/favourites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/config/di/di.dart';
import '../../../core/helper/shared_pref_manger.dart';
import '../../../domain/entities/request/product_request.dart';

@injectable
class FavouritesViewModel extends Cubit<FavouritesStates> {
  final AddToWishListUseCase addToWishListUseCase;
  final GetAllWishListUseCase getAllWishListUseCase;
  final RemoveItemWishListUseCase removeItemWishListUseCase;

  FavouritesViewModel({
    required this.addToWishListUseCase,
    required this.getAllWishListUseCase,
    required this.removeItemWishListUseCase,
  }) : super(FavouritesInitialState());

  bool isSelected = false;
  static FavouritesViewModel get instance => getIt<FavouritesViewModel>();

  String? getToken() {
    try {
      final prefs = SharedPrefManager();
      return prefs.getString("token");
    } catch (e) {
      print("Error in getToken: ${e.toString()}");
      return null;
    }
  }

  Future<void> addToWishList({required String productId}) async {
    try {
      final token = getToken();
      if (token == null) throw Exception("Token is null");

      final productRequest = ProductRequest(productId: productId);
      final wishListResponse = await addToWishListUseCase.invoke(token, productRequest);

      isSelected = true;
      emit(AddToWishListSuccessState(wishListResponse, isSelected));
    } catch (e) {
      emit(AddToWishListErrorState(e.toString()));
    }
  }

  Future<void> removeItemWishList({required String productId}) async {
    try {
      final token = getToken();
      if (token == null) throw Exception("Token is null");

      final productRequest = ProductRequest(productId: productId);
      final wishListResponse = await removeItemWishListUseCase.invoke(token, productRequest);

      isSelected = false;
      emit(DeleteItemWishListSuccessState(wishListResponse, isSelected));
    } catch (e) {
      emit(DeleteItemWishListErrorState(e.toString()));
    }
  }

  Future<void> getAllWishList() async {
    emit(FavouritesLoadingState());
    try {
      final token = getToken();
      if (token == null) throw Exception("Token is null");

      final wishListResponse = await getAllWishListUseCase.invoke(token);
      emit(GetAllWishListSuccessState(wishListResponse?.data ?? []));
    } catch (e) {
      emit(GetAllWishListErrorState(e.toString()));
    }
  }
}
