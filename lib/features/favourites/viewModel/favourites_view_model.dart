import 'package:ecommerce/domain/entities/response/product.dart';
import 'package:ecommerce/domain/use_cases/add_to_wishlist_use_case.dart';
import 'package:ecommerce/domain/use_cases/delete_items_in_cart_use_case.dart';
import 'package:ecommerce/domain/use_cases/get_items_wishlist_use_case.dart';
import 'package:ecommerce/domain/use_cases/update_count_in_cart_use_case.dart';
import 'package:ecommerce/features/favourites/viewModel/favourites_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/exceptions/app_exception.dart';
import '../../../domain/use_cases/delete_items_in_wishlist_use_case.dart';

@injectable
class FavouritesViewModel extends Cubit<FavouritesStates>{
  AddToWishlistUseCase addToWishlistUseCase ;
  GetItemsWishlistUseCase getItemsWishlistUseCase ;
  DeleteItemsInWishlistUseCase deleteItemsInCartUseCase ;
  UpdateCountInCartUseCase updateCountInCartUseCase ;
  FavouritesViewModel({required this.addToWishlistUseCase,
  required this.getItemsWishlistUseCase,required this.deleteItemsInCartUseCase,
  required this.updateCountInCartUseCase}):super(WishListInitialState());

  int numOfCartItems = 0 ;
  List<Product> productsList = [];

  static FavouritesViewModel get(context) => BlocProvider.of<FavouritesViewModel>(context);

  bool selected = false;

   toggleFavourites(){

    selected != selected;
    emit(ToggleState());

  }


  Future<void> addToWishList(String productId)async{
    try{
      emit(AddWishListLoadingState());
      var addWishList = await addToWishlistUseCase.invoke(productId);

      await getItemsWishList();
      toggleFavourites();
      emit(AddWishListSuccessState(addWishList: addWishList));
    }on AppException catch(e){
      emit(AddWishListErrorState(message: e.message));
    }
  }
  Future<void> getItemsWishList()async{
    try{
      emit(GetWishListLoadingState());
      var getWishListResponse = await getItemsWishlistUseCase.invoke();

      //productsList = getWishListResponse.data??[];
      emit(GetWishListSuccessState(getWishList: getWishListResponse));
    }on AppException catch(e){
      emit(GetWishListErrorState(message: e.message));
    }
  }


  Future<void> deleteCart(String productId)async{
    try{
      var deleteCartResponse = await deleteItemsInCartUseCase.invoke(productId);
      print('deleted items successfully.');
      await getItemsWishList();
      emit(DeleteWishListSuccessState(getWishList: deleteCartResponse,message: 'Deleted Item Successfully.'));
    }on AppException catch(e){
      emit(DeleteWishListErrorState(message: e.message));
    }
  }




}