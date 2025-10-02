import 'package:flutter/material.dart';

import '../../features/auth/login/view/login_screen.dart';
import '../../features/auth/register/view/register_screen.dart';
import '../../features/cart/view/cart_screen.dart';
import '../../features/category/view/category_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/product_details/product_details_screen.dart';


class AppRoutes {
  static String homeRoute = "home";
  static String productRoute = "productDetails";
  static String categoryRoute = "category";
  static String cartRoute = "cart";
  static String loginRoute = "login";
  static String registerRoute = "register";


  static Map<String, Widget Function(BuildContext)> routes = {

    homeRoute: (context) =>  HomeScreen(),
    productRoute: (context) =>  ProductDetailsScreen(),
    cartRoute: (context) => const CartScreen(),
    loginRoute: (context) =>  LoginScreen(),
    categoryRoute: (context) =>  CategoryScreen(),
    registerRoute: (context) =>  RegisterScreen(),

  };
}
