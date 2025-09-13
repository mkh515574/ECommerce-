import 'package:flutter/material.dart';

import '../../features/auth/login/login_screen.dart';

class AppRoutes {
  static String homeRoute = "home";
  static String productRoute = "productDetails";
  static String cartRoute = "cart";
  static String loginRoute = "login";
  static String registerRoute = "register";


  static Map<String, Widget Function(BuildContext)> routes = {

   // homeRoute: (context) => const HomeScreen(),
   // productRoute: (context) => const ProductDetailsScreen(),
    //cartRoute: (context) => const CartScreen(),
    loginRoute: (context) => const LoginScreen(),
    //registerRoute: (context) => const RegisterScreen(),

  };
}
