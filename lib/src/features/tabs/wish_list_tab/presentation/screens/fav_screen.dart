import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/features/tabs/wish_list_tab/presentation/widgets/favorites_tab_view_body.dart';

class FavoritesTabScreen extends StatelessWidget {
  const FavoritesTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _FavoritesTabView();
  }
}

class _FavoritesTabView extends StatelessWidget {
  const _FavoritesTabView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: FavoritesTabViewBody());
  }
}
