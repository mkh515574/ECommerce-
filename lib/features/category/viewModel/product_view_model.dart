import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/usecase/get_all_products_use_case.dart';
import 'package:ecommerce/features/category/viewModel/product_states.dart';
import 'package:injectable/injectable.dart';
@injectable

class ProductViewModel extends Cubit<ProductStates>{
  GetAllProductsUseCase getAllProductsUseCase;
  
  ProductViewModel({required this.getAllProductsUseCase}): super(ProductInitialState());
  
  getAllProducts() async{
    emit(ProductLoadingState());

    try {
      var categories = await getAllProductsUseCase.invoke();
      emit(ProductSuccessState(categories!));
    } catch (e) {
      emit(ProductErrorState(e.toString()));
    }
  }
  
}