import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/category_item.dart';

class CategoryGridView extends StatelessWidget {
  const CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const CategoryItem();
        },
      ),
    );
  }
}
