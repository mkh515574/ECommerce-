import 'package:ecommerce/core/config/di/di.dart';
import 'package:ecommerce/features/home/viewModel/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewModel/home_view_model.dart';
import 'category_grid_item.dart';


class BrandGridBuilder extends StatelessWidget {
  HomeViewModel homeViewModel = getIt<HomeViewModel>();

  BrandGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: homeViewModel..getAllBrands(),

      builder: (context, state) {
        if(state is HomeSuccessBrandState){
          return SizedBox(
            height: 270.h,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CategoryGridItem(
                    category: state.categories[index],
                  ),
              itemCount: state.categories.length,
            ),
          );
        }else if(state is HomeErrorBrandState){
          return Text(state.message);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
