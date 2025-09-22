import 'package:ecommerce/core/config/di/di.dart';
import 'package:ecommerce/features/home/viewModel/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../viewModel/home_view_model.dart';
import 'category_grid_item.dart';
class BrandGridBuilder extends StatelessWidget {
  final HomeViewModel homeViewModel = getIt<HomeViewModel>();

  BrandGridBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: BlocBuilder<HomeViewModel, HomeStates>(
        bloc: homeViewModel..getAllBrands(),
        builder: (context, state) {
          if (state is HomeSuccessBrandState) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.h,
                crossAxisSpacing: 4.w,
                mainAxisExtent: 120.w,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                final brand = state.categories[index];
                return CategoryGridItem(category: brand);
              },
            );
          } else if (state is HomeErrorBrandState) {
            return Center(child: Text(state.message));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
