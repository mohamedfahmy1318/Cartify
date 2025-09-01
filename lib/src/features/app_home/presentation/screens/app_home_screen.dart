import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/features/app_home/presentation/widgets/app_bottom_bar.dart';
import 'package:full_ecommerce_app/src/features/tabs/cart_tab/presentation/screens/cart_tab_screen.dart';
import 'package:full_ecommerce_app/src/features/tabs/categories_tab/presentation/screens/categories_screen.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/screens/home_tab_screen.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/screens/profile_Screen.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/screens/fav_screen.dart';

class AppHomeScreen extends StatelessWidget {
  const AppHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _AppHomeView();
  }
}

class _AppHomeView extends StatefulWidget {
  const _AppHomeView();

  @override
  State<_AppHomeView> createState() => _AppHomeViewState();
}

class _AppHomeViewState extends State<_AppHomeView> {
  int selectedIndex = 0;

  final List<Widget> screens = <Widget>[
    const HomeTabScreen(),
    const CategoriesTabScreen(),
        const CartTabScreen(),

    const FavoritesTabScreen(),
    const ProfileTabScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SafeArea(
        child: IndexedStack(index: selectedIndex, children: screens),
      ),
      bottomNavigationBar: AppBottomBar(
        currentIndex: selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
