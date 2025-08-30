import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:full_ecommerce_app/src/config/res/app_sizes.dart';
import 'package:full_ecommerce_app/src/config/res/color_manager.dart';
import 'package:full_ecommerce_app/src/core/widgets/image_widgets/cached_image.dart';
import 'package:full_ecommerce_app/src/features/tabs/home_tab/domain/entities/banner_entity.dart';

class BannerItem extends StatefulWidget {
  const BannerItem({super.key, required this.banner});

  final BannerEntity banner;

  @override
  State<BannerItem> createState() => _BannerItemState();
}

class _BannerItemState extends State<BannerItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.97).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 100.w, // Fixed width for proper layout in ListView
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppCircular.r10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppCircular.r10),
              child: SizedBox(
                child: Stack(
                  children: [
                    // Main image
                    CachedImage(
                      url: widget.banner.image,
                      fit: BoxFit.contain,
                      borderRadius: BorderRadius.circular(AppCircular.r10),
                      bgColor: AppColors.white,
                      boxShape: BoxShape.rectangle,
                    ),

                    // Gradient overlay for better text readability
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppCircular.r10),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.primary.withOpacity(0.7),
                            Colors.black.withOpacity(0.33),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
