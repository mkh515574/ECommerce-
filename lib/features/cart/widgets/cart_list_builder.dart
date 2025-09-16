import 'package:flutter/material.dart';

import 'cart_list_item.dart';

class CartListBuilder extends StatelessWidget {
  const CartListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => CartListItem(),
        itemCount: 2,
      ),
    );
  }
}
