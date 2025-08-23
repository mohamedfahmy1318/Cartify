import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/presentation/widgets/home_tab_view_body.dart';

class HomeTabScreen extends StatelessWidget {
  const HomeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _HomeTabView();
  }
}

class _HomeTabView extends StatelessWidget {
  const _HomeTabView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomeTabViewBody());
  }
}
