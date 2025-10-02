import 'package:ecommerce/core/utils/app_routes.dart';
import 'package:ecommerce/core/utils/app_theme.dart';
import 'package:ecommerce/features/cart/viewModel/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cache/shared_prefs_utils.dart';
import 'core/config/di/di.dart';
import 'core/helper/bloc_observer.dart';
import 'core/helper/shared_pref_manger.dart';
import 'features/favourites/viewModel/favourites_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefManager().init();
  await SharedPrefsUtils.init();

  Bloc.observer = MyBlocObserver();
  configureDependencies();

  String route = await autoLogin();

  runApp(MyApp(route: route));
}

class MyApp extends StatelessWidget {
  final String route;
  const MyApp({super.key, required this.route});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<CartViewModel>(
          create: (context) => getIt<CartViewModel>()..getItemsCart()
        ),
        BlocProvider<FavouritesViewModel>(
          create: (context) => getIt<FavouritesViewModel>()..getItemsWishList(),
        ),
      ],

      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp(
          title: 'ECommerce App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          initialRoute: route,
          routes: AppRoutes.routes,
        ),

      ),
    );
  }
}

Future<String> autoLogin() async {
  try {
    final prefs = await SharedPrefManager();
    final token = prefs.getString("token");
    if (token == null || token.isEmpty) {
      return AppRoutes.loginRoute;
    } else {
      return AppRoutes.homeRoute;
    }
  } catch (e) {
    print('Error in auto login: $e');

    return AppRoutes.loginRoute;

  }
}
