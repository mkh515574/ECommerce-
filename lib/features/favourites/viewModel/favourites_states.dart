import 'package:ecommerce/domain/entities/response/products/product.dart';

import '../../../domain/entities/response/wishlist/add_to_wishlist.dart';

sealed class FavouritesStates {}

class FavouritesInitialState extends FavouritesStates {}

class FavouritesLoadingState extends FavouritesStates {}

class AddToWishListSuccessState extends FavouritesStates {
  final AddToWishList? wishListResponse;
  bool? isSelected ;
   AddToWishListSuccessState(this.wishListResponse,[this.isSelected]);
}

class AddToWishListErrorState extends FavouritesStates {
  final String message;
  AddToWishListErrorState(this.message);
}
class DeleteItemWishListSuccessState extends FavouritesStates {
  final AddToWishList? wishListResponse;
  bool? isSelected ;
  DeleteItemWishListSuccessState(this.wishListResponse,[this.isSelected]);
}

class DeleteItemWishListErrorState extends FavouritesStates {
  final String message;
  DeleteItemWishListErrorState(this.message);
}

class GetAllWishListSuccessState extends FavouritesStates {
  final List<Product> products;
  GetAllWishListSuccessState(this.products);
}

class GetAllWishListErrorState extends FavouritesStates {
  final String message;
  GetAllWishListErrorState(this.message);
}
