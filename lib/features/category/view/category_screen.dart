import 'package:ecommerce/core/config/di/di.dart';
import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/features/category/view/widgets/product_tab_item.dart';
import 'package:ecommerce/features/category/viewModel/product_states.dart';
import 'package:ecommerce/features/category/viewModel/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_bar.dart';

class CategoryScreen extends StatelessWidget {
  ProductViewModel productViewModel = getIt<ProductViewModel>();

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          SizedBox(height: 10.h),
          BlocBuilder<ProductViewModel, ProductStates>(
            bloc: productViewModel..getAllProducts(),
            builder: (context, state) {
              if (state is ProductSuccessState) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.productRoute);
                        },
                        child: ProductTabItem(product: state.products[index],),
                      ),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,

                        childAspectRatio: 0.75,
                      ),
                      itemCount: state.products.length,
                    ),
                  ),
                );

              } else if (state is ProductErrorState) {
                return Text(state.message);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
