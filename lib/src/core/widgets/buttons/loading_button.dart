import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';

import '../../../config/res/app_sizes.dart';
import 'custom_animated_button.dart';

class LoadingButton extends StatelessWidget {
  final String title;
  final Future<void> Function() onTap;
  final Color? textColor;
  final Color? color;
  final BorderSide borderSide;
  final double? borderRadius;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const LoadingButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.borderSide = BorderSide.none,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          margin ??
          EdgeInsets.symmetric(
            horizontal: AppMargin.mW10,
            vertical: AppMargin.mH10,
          ),
      child: CustomAnimatedButton(
        onTap: onTap,
        width: width ?? MediaQuery.sizeOf(context).width,
        minWidth: AppSize.sW50,
        height: height ?? AppSize.sH50,
        color: color ?? AppColors.primary,
        borderRadius: borderRadius ?? AppSize.sH10,
        disabledColor: color ?? AppColors.primary,
        borderSide: borderSide,
        loader: const CupertinoActivityIndicator(color: Colors.white),
        child: Text(
          title,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? FontSize.s14,
          ),
        ),
      ),
    );
  }
}
