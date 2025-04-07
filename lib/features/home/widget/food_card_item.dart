import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/home/widget/sub_food_card_item.dart';

class FoodCardItem extends StatelessWidget {
  final String mealImageUrl;
  final String mealName;
  final String mealRate;
  final String cookedTime;
  const FoodCardItem({
    super.key,
    required this.mealImageUrl,
    required this.mealName,
    required this.mealRate,
    required this.cookedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: 153.w,
        height: 180.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(8.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 137.w,
              height: 106.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                  image: NetworkImage(mealImageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(mealName, style: AppStyle.black16Medium),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SubFoodCardItem(icon: AppAssets.startIcon, text: mealRate),
                SubFoodCardItem(icon: AppAssets.startIcon, text: cookedTime),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
