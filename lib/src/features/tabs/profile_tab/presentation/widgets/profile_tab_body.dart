import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/assets.gen.dart';
import 'package:full_ecommerce_app/src/config/res/constants_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/navigation/named_routes.dart';
import 'package:full_ecommerce_app/src/core/navigation/navigator.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/widgets/custom_card_info.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/widgets/reset_and_edit_buttons.dart';

class ProfileTabBody extends StatelessWidget {
  const ProfileTabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.png.iconProfile.path,
          width: 135.w,
          height: 140.h,
        ),
        10.szH,
        const CustomCardInfo(),
        15.szH,
        const ResetAndEditButtons(),
        10.szH,
        DefaultButton(
          title: 'Logout',
          onTap: () {
            sl<UserCubit>().logout();
            Future.delayed(const Duration(seconds: 1))
                .then((value) => Go.offAllNamed( NamedRoutes.login));
          },
          height: 47.h,
          fontSize: 18.sp,
          color: Colors.red,
        ),
      ],
    );
  }
}


