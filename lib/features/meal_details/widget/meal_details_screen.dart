import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/home/widget/sub_food_card_item.dart';
import 'package:meals_app/features/meal_details/widget/top_meal_details_item.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopMealDetailsItem(),
              const SizedBox(height: 16),
              Text(
                "Cheese Burger 🍔",
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
                    SubFoodCardItem(icon: AppAssets.timerIcon, text: "20-30"),
                    SubFoodCardItem(icon: AppAssets.startIcon, text: "4.9"),
                  ],
                ),
              ),
              const SizedBox(height: 27),

              Divider(thickness: 2.sp, height: 2.sp, color: AppColors.gray),
              const SizedBox(height: 24),
              Text("Description", style: AppStyle.black16Medium),
              const SizedBox(height: 8),
              Text(
                "Burger With Meat is a typical food from our restaurant that is much in demand by many people, this is very recommended for you.",
                style: AppStyle.gray14spMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
