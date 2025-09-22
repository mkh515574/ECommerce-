import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_styles.dart';
import 'package:ecommerce/features/favourites/viewModel/favourites_states.dart';
import 'package:ecommerce/features/favourites/viewModel/favourites_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/di/di.dart';
import 'favourite_list_item.dart';class FavouriteListBuilder extends StatefulWidget {
  const FavouriteListBuilder({super.key});

  @override
  State<FavouriteListBuilder> createState() => _FavouriteListBuilderState();
}

class _FavouriteListBuilderState extends State<FavouriteListBuilder> {
  final FavouritesViewModel viewModel = getIt<FavouritesViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.getAllWishList(); // call once
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouritesViewModel, FavouritesStates>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is GetAllWishListSuccessState) {
          final products = state.products;

          if (products.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.likeDislikeIcon, height: 100.h),
                  SizedBox(height: 10.h),
                  Text("No Favourites Found",
                      style: AppStyles.semi20Primary),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return FavouriteListItem(
                product: products[index],
                onTap: (){
                  viewModel.removeItemWishList(productId: products[index].id??"");
                },
              );
            },
          );
        } else if (state is GetAllWishListErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
