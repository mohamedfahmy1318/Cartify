import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/extensions/sized_box_helper.dart';
import 'package:full_ecommerce_app/src/core/extensions/string_extension.dart';
import 'package:full_ecommerce_app/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:full_ecommerce_app/src/core/helpers/location_notifier.dart';
import 'package:full_ecommerce_app/src/core/widgets/app_text.dart';
import 'package:full_ecommerce_app/src/core/widgets/buttons/default_button.dart';
import 'package:full_ecommerce_app/src/features/tabs/profile_tab/presentation/widgets/custom_title_profile.dart';

class CustomCardInfo extends StatelessWidget {
  const CustomCardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        final user = state.userModel;
        final isLoggedIn = state.userStatus == UserStatus.loggedIn;
        
        return Container(
          padding: EdgeInsets.all(20.sp),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.sp),
            boxShadow: [
              BoxShadow(
                color: AppColors.grey.withOpacity(0.2),
                blurRadius: 8.sp,
                offset: Offset(0, 4.sp),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                isLoggedIn && user.name?.isNotEmpty == true 
                    ? user.name!.toCamelCase() 
                    : 'Guest User',
                fontSize: 19.sp,
                fontWeight: FontWeight.w700,
              ),
              12.szH,
              CustomTitleProfile(
                icon: Icons.email,
                title: isLoggedIn && user.email?.isNotEmpty == true 
                    ? user.email!.toCamelCase() 
                    : 'No Email',
              ),
              13.szH,
         
              12.szH,
              ValueListenableBuilder<String?>(
                valueListenable: LocationNotifier(),
                builder: (context, location, child) {
                  return CustomTitleProfile(
                    icon: Icons.location_on,
                    title: location ?? "Loading Location...",
                  );
                },
              ),
              12.szH,
         
              CustomTitleProfile(
                icon: Icons.group,
                title: isLoggedIn && user.role?.isNotEmpty == true 
                    ? user.role!.toCamelCase()
                    : 'Guest',
              ),
          
            ],
          ),
        );
      },
    );
  }
}
