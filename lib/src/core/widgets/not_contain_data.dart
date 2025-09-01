import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/language/locale_keys.g.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';

import '../../config/res/app_sizes.dart';

class NotContainData extends StatelessWidget {
  const NotContainData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppAssets.lottie.noData.lottie(
            width: MediaQuery.of(context).size.width * .7,
            height: MediaQuery.of(context).size.height * .1,
          ),
          SizedBox(height: AppSize.sH10),
          SizedBox(height: AppSize.sH10),
          Text(LocaleKeys.errorexceptionNotcontaindesc),
        ],
      ),
    );
  }
}
