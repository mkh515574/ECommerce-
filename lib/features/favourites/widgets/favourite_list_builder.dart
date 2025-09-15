
import 'package:flutter/material.dart';

import 'favourite_list_item.dart';

class FavouriteListBuilder extends StatelessWidget {
  const FavouriteListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView.builder(itemBuilder: (context, index)=> FavouriteListItem(),itemCount: 10,));
  }
}
