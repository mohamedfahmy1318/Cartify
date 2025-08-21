import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/res/color_manager.dart';

class CustomWidgetValidator<T> extends StatelessWidget {
  final T? initialValue;
  final FormFieldValidator<T> validator;
  final Widget? child;
  final Widget Function(FormFieldState<T> value) builder;
  const CustomWidgetValidator({
    super.key,
    this.initialValue,
    required this.validator,
    this.child,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: initialValue,
      validator: validator,
      builder: (FormFieldState<T> field) {
        return builder(field);
      },
    );
  }
}

class DefaultErrorBody extends StatelessWidget {
  final FormFieldState<Object?> value;
  final Widget child;
  const DefaultErrorBody({super.key, required this.value, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: value.hasError
                ? Border.all(color: AppColors.error, width: .005)
                : null,
          ),
          child: child,
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: value.hasError ? null : 0,
          child: value.hasError
              ? Padding(
                  padding: EdgeInsets.only(top: 6.h, left: 12.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: AppColors.error,
                        size: 16.sp,
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Text(
                          value.errorText ?? '',
                          style: TextStyle(
                            color: AppColors.error,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}
