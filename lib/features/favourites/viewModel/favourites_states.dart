
import 'package:ecommerce/domain/entities/response/add_wishlist.dart';
import 'package:ecommerce/domain/entities/response/favourites_response.dart';

sealed class FavouritesStates{}
class WishListInitialState extends FavouritesStates{}
class AddWishListLoadingState extends FavouritesStates{}
class AddWishListErrorState extends FavouritesStates{
  String message ;
  AddWishListErrorState({required this.message});
}
class AddWishListSuccessState extends FavouritesStates{
  AddWishList addWishList ;
  AddWishListSuccessState({required this.addWishList});
}
class GetWishListLoadingState extends FavouritesStates{}
class ToggleState extends FavouritesStates{}

class GetWishListErrorState extends FavouritesStates{
  String message ;
  GetWishListErrorState({required this.message});
}
class GetWishListSuccessState extends FavouritesStates{
  FavouritesResponse getWishList ;
  String? message ;

  GetWishListSuccessState({required this.getWishList,this.message});}
// }
class DeleteWishListLoadingState extends FavouritesStates{}
class DeleteWishListErrorState extends FavouritesStates{
  String message ;
  DeleteWishListErrorState({required this.message});
}
class DeleteWishListSuccessState extends FavouritesStates{
  AddWishList getWishList ;

  String? message ;
  DeleteWishListSuccessState({required this.getWishList,this.message});
}
// class UpdateWishListLoadingState extends WishListStates{}
// class UpdateWishListErrorState extends WishListStates{
//   String message ;
//   UpdateWishListErrorState({required this.message});
// }
// class UpdateWishListSuccessState extends WishListStates{
//   GetWishList getWishList ;
//   UpdateWishListSuccessState({required this.getWishList});
// }