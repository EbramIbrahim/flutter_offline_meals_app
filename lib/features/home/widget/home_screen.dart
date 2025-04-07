import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/home/widget/food_card_item.dart';
import 'package:meals_app/features/home/widget/home_top_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTopItem(),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("Your Food", style: AppStyle.black16Medium),
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FoodCardItem(
                    mealImageUrl:
                        "https://www.eatingwell.com/thmb/zvHrm_Z8F2qLeJenpJ6lYodtq7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/57831531-73819d8ce8f5413cac42cf1c907bc37a.jpg",
                    mealName: "Cheese Burger",
                    mealRate: "4.9",
                    cookedTime: "20-30",
                  ),
                  FoodCardItem(
                    mealImageUrl:
                        "https://www.eatingwell.com/thmb/zvHrm_Z8F2qLeJenpJ6lYodtq7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/57831531-73819d8ce8f5413cac42cf1c907bc37a.jpg",
                    mealName: "Cheese Burger",
                    mealRate: "4.9",
                    cookedTime: "20-30",
                  ),
                ],
              ),
              const SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FoodCardItem(
                    mealImageUrl:
                        "https://www.eatingwell.com/thmb/zvHrm_Z8F2qLeJenpJ6lYodtq7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/57831531-73819d8ce8f5413cac42cf1c907bc37a.jpg",
                    mealName: "Cheese Burger",
                    mealRate: "4.9",
                    cookedTime: "20-30",
                  ),
                  FoodCardItem(
                    mealImageUrl:
                        "https://www.eatingwell.com/thmb/zvHrm_Z8F2qLeJenpJ6lYodtq7M=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/57831531-73819d8ce8f5413cac42cf1c907bc37a.jpg",
                    mealName: "Cheese Burger",
                    mealRate: "4.9",
                    cookedTime: "20-30",
                  ),
                ],
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
        floatingActionButton: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Container(
              width: 60.sp,
              height: 60.sp,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: AppColors.primary),
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: Icon(Icons.add, color: AppColors.primary, size: 20.sp),
            ),
          ),
        ),
      ),
    );
  }
}
