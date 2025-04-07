import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';

class HomeTopItem extends StatelessWidget {
  const HomeTopItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 250.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.homeTitleImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 18.h,
          top: 18.w,
          left: 30.w,
          child: Container(
            width: 182.w,
            height: 186.h,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(48.r),
            ),
            alignment: Alignment.center,
            child: Text(
              "Welcome Add A New Recipe",
              style: AppStyle.onBoardingTitleStyle,
              textAlign: TextAlign.left,
            ),
          ),
        ),
      ],
    );
  }
}
