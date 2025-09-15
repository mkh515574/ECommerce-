import 'package:ecommerce/core/utils/app_assets.dart';
import 'package:ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../category/category_screen.dart';
import '../favourites/favourite_screen.dart';
import '../profile/profile_screen.dart';
import 'home_tab/home_screen_body.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreenBody(),
    const CategoryScreen(),
    const FavouriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.primaryColor,

        currentIndex: selectedIndex,
        onTap: (index) {
          selectedIndex = index;
          setState(() {});
        },
        items: [
          buildBottomNavigationBarItem(
            selectedIcon: AppAssets.selectedHomeIcon,
            unSelectedIcon: AppAssets.unSelectedHomeIcon,
            index: 0,
            selectedIndex: selectedIndex,
          ),
          buildBottomNavigationBarItem(
            selectedIcon: AppAssets.selectedCategoryIcon,
            unSelectedIcon: AppAssets.unSelectedCategoryIcon,
            index: 1,
            selectedIndex: selectedIndex,
          ),
          buildBottomNavigationBarItem(
            selectedIcon: AppAssets.selectedFavouriteIcon,
            unSelectedIcon: AppAssets.unSelectedFavouriteIcon,
            index: 2,
            selectedIndex: selectedIndex,
          ),
          buildBottomNavigationBarItem(
            selectedIcon: AppAssets.selectedAccountIcon,
            unSelectedIcon: AppAssets.unSelectedAccountIcon,
            index: 3,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}

BottomNavigationBarItem buildBottomNavigationBarItem({
  required String selectedIcon,
  required String unSelectedIcon,
  required int index,
  required int selectedIndex,
}) {
  return BottomNavigationBarItem(
    icon: CircleAvatar(
      radius: 20.w,
      backgroundColor: selectedIndex == index ? AppColors.whiteColor : AppColors.primaryColor,
      child: Image.asset(
        selectedIndex == index ? selectedIcon : unSelectedIcon,
        color: selectedIndex == index ? AppColors.primaryColor : AppColors.whiteColor,
      ),
    ),
    label: '',
  );
}
