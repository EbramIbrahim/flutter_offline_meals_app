import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';

class TopMealDetailsItem extends StatelessWidget {
  const TopMealDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 327.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            image: DecorationImage(
              image: AssetImage(AppAssets.homeTitleImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: 20.h,
          left: 10.h,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: Container(
                width: 36.sp,
                height: 36.sp,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.white),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
