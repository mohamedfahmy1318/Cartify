import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppCircular.r20),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow.withOpacity(0.15),
            spreadRadius: 0,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          color: AppColors.primary.withOpacity(0.25),
          width: 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppCircular.r25),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: onTap,
          unselectedItemColor: AppColors.grey.withOpacity(0.5),
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home_outlined, 0),
              activeIcon: _buildActiveIcon(Icons.home, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.grid_view_rounded, 1),
              activeIcon: _buildActiveIcon(Icons.grid_view_rounded, 1),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.shopping_cart_outlined, 2),
              activeIcon: _buildActiveIcon(Icons.shopping_cart, 2),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.favorite_outline_rounded, 3),
              activeIcon: _buildActiveIcon(Icons.favorite_rounded, 3),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person_outline_rounded, 4),
              activeIcon: _buildActiveIcon(Icons.person_rounded, 4),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return Container(
      padding: EdgeInsets.all(AppPadding.pH8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppCircular.r12),
      ),
      child: Icon(
        icon,
        size: 21.w,
        color: currentIndex == index
            ? AppColors.primary
            : AppColors.grey.withOpacity(0.6),
      ),
    );
  }

  Widget _buildActiveIcon(IconData icon, int index) {
    return Container(
      padding: EdgeInsets.all(AppPadding.pH8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppCircular.r12),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.61),
          width: 1,
        ),
      ),
      child: Icon(icon, size: 28.w, color: AppColors.primary),
    );
  }
}
