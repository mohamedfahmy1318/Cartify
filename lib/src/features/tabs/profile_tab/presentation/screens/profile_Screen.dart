import 'package:flutter/material.dart';

import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/widgets/profile_app_bar.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/widgets/profile_tab_body.dart';

class ProfileTabScreen extends StatelessWidget {
  const ProfileTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProfileTabView();
  }
}

class ProfileTabView extends StatelessWidget {
  const ProfileTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(),
      body: Padding(
        padding: EdgeInsets.all(12.0),
        child: ProfileTabBody(),
      ),
    );
  }
}




