import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/home/model/meal_model.dart';
import 'package:meals_app/features/home/widget/sub_food_card_item.dart';
import 'package:meals_app/features/meal_details/widget/top_meal_details_item.dart';

class MealDetailsScreen extends StatelessWidget {
  final Meal meal;
  const MealDetailsScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TopMealDetailsItem(imageUrl: meal.imageUrl),
                const SizedBox(height: 16),
                Text(
                  meal.name,
                  style: AppStyle.onBoardingTitleStyle.copyWith(
                    fontSize: 24.sp,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 21),
                Container(
                  height: 33.h,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.6),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SubFoodCardItem(
                        icon: AppAssets.timerIcon,
                        text: meal.time,
                      ),
                      SubFoodCardItem(
                        icon: AppAssets.startIcon,
                        text: meal.rate.toString(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 27),

                Divider(thickness: 2.sp, height: 2.sp, color: AppColors.gray),
                const SizedBox(height: 24),
                Text("Description", style: AppStyle.black16Medium),
                const SizedBox(height: 8),
                Text(meal.description, style: AppStyle.gray14spMedium),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
