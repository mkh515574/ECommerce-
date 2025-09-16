import 'package:bloc/bloc.dart';
import 'package:ecommerce/domain/usecase/get_all_brands_use_case.dart';
import 'package:ecommerce/features/home/viewModel/home_states.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecase/get_all_category_use_case.dart';
@injectable
class HomeViewModel extends Cubit<HomeStates> {
  GetAllCategoryUseCase getAllCategoryUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeViewModel({required this.getAllCategoryUseCase,required this.getAllBrandsUseCase})
    : super(HomeInitialState());

  getAllCategories() async{
    emit(HomeLoadingState());

    try {
      var categories = await getAllCategoryUseCase.invoke();
      emit(HomeSuccessState(categories!));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }
  getAllBrands() async{
    emit(HomeLoadingState());

    try {
      var categories = await getAllBrandsUseCase.invoke();
      emit(HomeSuccessBrandState(categories!));
    } catch (e) {
      emit(HomeErrorBrandState(e.toString()));
    }
  }
}
