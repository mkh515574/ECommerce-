import 'package:ecommerce/features/favourites/view/widgets/favourite_list_builder.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_app_bar.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: [CustomAppBar(), Expanded(child: FavouriteListBuilder())]),
    );
  }
}
