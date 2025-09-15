import 'package:flutter/material.dart';

import '../../features/auth/login/login_screen.dart';
import '../../features/auth/register/register_screen.dart';
import '../../features/category/category_screen.dart';
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
    productRoute: (context) => const ProductDetailsScreen(),
    //cartRoute: (context) => const CartScreen(),
    loginRoute: (context) => const LoginScreen(),
    categoryRoute: (context) => const CategoryScreen(),
    registerRoute: (context) => const RegisterScreen(),
  };
}
