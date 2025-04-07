import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_route.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/home/model/db_helper.dart';
import 'package:meals_app/features/home/model/meal_model.dart';
import 'package:meals_app/features/home/widget/food_card_item.dart';
import 'package:meals_app/features/home/widget/home_top_item.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [HomeTopItem()]),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Your Food", style: AppStyle.black16Medium),
                    const SizedBox(height: 25),

                    FutureBuilder(
                      future: databaseHelper.getMeals(),
                      builder: (context, snapShot) {
                        if (snapShot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapShot.hasError) {
                          return Center(child: Text("${snapShot.error}"));
                        } else if (snapShot.data!.isEmpty) {
                          return Center(child: Text("No Meals Unitl Now!"));
                        } else if (snapShot.hasData) {
                          return SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: GridView.builder(
                              itemCount: snapShot.data!.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 22.sp,
                                    crossAxisSpacing: 8.sp,
                                    childAspectRatio: 0.9,
                                  ),
                              itemBuilder: (context, index) {
                                Meal meal = snapShot.data![index];
                                return FoodCardItem(
                                  mealImageUrl: meal.imageUrl,
                                  mealName: meal.name,
                                  mealRate: meal.rate.toString(),
                                  cookedTime: meal.time,
                                  description: meal.description,
                                );
                              },
                            ),
                          );
                        }
                        return Center(child: Text("No Meals Founded!"));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        floatingActionButton: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pushNamed(AppRoute.addMealsScreen);
            },
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
