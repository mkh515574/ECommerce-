import 'package:ecommerce/domain/entities/response/cart/products.dart';
import 'package:flutter/material.dart';

import 'cart_list_item.dart';

class CartListBuilder extends StatelessWidget {
  final List<Products> products;
  const CartListBuilder({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => CartListItem(product: products[index],),
        itemCount: 2,
      ),
    );
  }
}
