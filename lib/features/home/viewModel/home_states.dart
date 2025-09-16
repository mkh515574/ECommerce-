import 'package:ecommerce/domain/entities/response/category/category.dart';

sealed class HomeStates {}

class HomeInitialState extends HomeStates{}
class HomeLoadingState extends HomeStates{}
class HomeSuccessState extends HomeStates{
  final List<Category> categories;
  HomeSuccessState(this.categories);
}
class HomeErrorState extends HomeStates{
  final String message;
  HomeErrorState(this.message);


}
class HomeBrandState extends HomeStates{}
class HomeSuccessBrandState extends HomeStates{
  final List<Category> categories;
  HomeSuccessBrandState(this.categories);
}
class HomeErrorBrandState extends HomeStates{
  final String message;
  HomeErrorBrandState(this.message);


}