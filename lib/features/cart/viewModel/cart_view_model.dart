
import 'package:ecommerce/core/config/di/di.dart';
import 'package:ecommerce/domain/entities/request/product_request.dart';
import 'package:ecommerce/domain/usecase/add_to_cart_use_case.dart';
import 'package:ecommerce/domain/usecase/get_cart_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../core/helper/shared_pref_manger.dart';
import 'cart_states.dart';

@injectable
class CartViewModel extends Cubit<CartStates>{
  GetCartUseCase getCartUseCase;
  AddToCartUseCase  addToCartUseCase;
  CartViewModel({required this.getCartUseCase,required this.addToCartUseCase}):super(CartInitialState());




  static CartViewModel get instance => getIt<CartViewModel>();

  int? numOfCartItems =0;
  Future<void> getCart() async {
    emit(CartLoadingState());

    try {
      final prefs = SharedPrefManager();

      String? token = prefs.getString("token");
      if (token == null) {
        emit(CartErrorState("User not logged in"));
        return;
      }

      final cart = await getCartUseCase.invoke(token);

      if (cart == null) {
        emit(CartErrorState("Failed to load cart"));
        return;
      }

      numOfCartItems = cart.numOfCartItems;
      emit(CartSuccessState(numOfCartItems ?? 0, cart));
    } catch (e) {
      emit(CartErrorState("Unexpected error: ${e.toString()}"));
    }
  }


  addToCart({required String productId})async{

    try {
      final prefs = SharedPrefManager();

      String? token = prefs.getString("token");

      ProductRequest productRequest = ProductRequest(productId: productId);



      var cart = await addToCartUseCase.invoke(token!,productRequest);
      print("Response type: ${cart.runtimeType}");

      print("done");


      emit(AddToCartSuccessState(cart));
    } catch (e) {
      print(e.toString());
      emit(CartErrorState(e.toString()));
    }
  }
}