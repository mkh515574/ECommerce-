import 'package:ecommerce/features/cart/view/widgets/cart_screen_body.dart';
import 'package:ecommerce/features/cart/viewModel/cart_states.dart';
import 'package:ecommerce/features/cart/viewModel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.primaryColor),
        ),

        title: Text(
          "Cart",
          style: AppStyles.medium14PrimaryDark.copyWith(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(AppAssets.searchIcon),
          ),
          SizedBox(width: 16.w),
          GestureDetector(
            onTap: () {},
            child: Image.asset(AppAssets.shoppingCart),
          ),

          SizedBox(width: 16.w),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<CartViewModel, CartStates>(
        builder: (context, state) {
          if(state is CartSuccessState){
            return CartScreenBody(data: state.cartResponse!.data!
              ,);

          }else if(state is CartErrorState){
            return Center(
              child: Text(state.message),
            );
          }else{
            return Center(
              child:
              CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
