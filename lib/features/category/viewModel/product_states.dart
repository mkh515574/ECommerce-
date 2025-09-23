
import '../../../domain/entities/response/product.dart';

sealed class ProductStates {}

class ProductInitialState extends ProductStates{}
class ProductLoadingState extends ProductStates{}
class ProductSuccessState extends ProductStates{
  final List<Product> products;
  ProductSuccessState(this.products);
}
class ProductErrorState extends ProductStates{
  final String message;
  ProductErrorState(this.message);


}