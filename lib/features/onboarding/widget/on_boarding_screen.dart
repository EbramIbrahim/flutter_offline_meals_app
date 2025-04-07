import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/routing/app_route.dart';
import 'package:meals_app/core/styling/app_assets.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';
import 'package:meals_app/features/onboarding/model/on_boarding_item.dart';
import 'package:meals_app/features/onboarding/services/on_boarding_services.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<StatefulWidget> createState() => _OnBoardingScreen();
}

class _OnBoardingScreen extends State<OnBoardingScreen> {
  List<OnBoardingItem> getOnBoardingItems = [
    OnBoardingItem(
      "Save Your Meals Ingredient",
      "Add Your Meals and its Ingredients and we will save it for you",
    ),
    OnBoardingItem(
      "Use Our App The Best Choice",
      "the best choice for your kitchen do not hesitate",
    ),
    OnBoardingItem(
      " Our App Your Ultimate Choice",
      "All the best restaurants and their top menus are ready for you",
    ),
  ];

  int currentPage = 0;

  CarouselSliderController controller = CarouselSliderController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bool isFirst = OnBoardingServices.isFirstTime();
      if (isFirst == false) {
        context.pushReplacementNamed(AppRoute.homeScreen);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.onboardingImage),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          bottom: 16.h,
          right: 32.w,
          left: 32.w,
          child: Container(
            width: 311.w,
            height: 450.h,
            padding: EdgeInsets.all(32.sp),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(48.r),
            ),
            child: Column(
              children: [
                CarouselSlider(
                  carouselController: controller,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    height: 260.h,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                  ),
                  items:
                      getOnBoardingItems.map((item) {
                        return Builder(
                          builder: (BuildContext context) {
                            return SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      item.title,
                                      style: AppStyle.onBoardingTitleStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Material(
                                    color: Colors.transparent,
                                    child: Text(
                                      item.description,
                                      style: AppStyle.onBoardingDescStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),
                DotsIndicator(
                  dotsCount: 3,
                  position: currentPage.toDouble(),
                  decorator: DotsDecorator(
                    size: Size(24.w, 6.h),
                    activeSize: Size(24.w, 6.h),
                    color: AppColors.gray, // Inactive color
                    activeColor: AppColors.white,
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0.r),
                    ),
                  ),
                ),

                Spacer(),
                currentPage >= 2
                    ? Center(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            OnBoardingServices.setFirstTimeWithFalse();
                            GoRouter.of(
                              context,
                            ).pushReplacementNamed(AppRoute.homeScreen);
                          },
                          child: Container(
                            width: 62.sp,
                            height: 62.sp,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: AppColors.primary,
                              size: 32.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              OnBoardingServices.setFirstTimeWithFalse();
                              GoRouter.of(
                                context,
                              ).pushReplacementNamed(AppRoute.homeScreen);
                            },
                            child: Text(
                              "Skip",
                              style: AppStyle.white14spSemiBold,
                            ),
                          ),
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              if (currentPage < 2) {
                                currentPage++;
                                controller.animateToPage(currentPage);
                              }
                            },
                            child: Text(
                              "Next",
                              style: AppStyle.white14spSemiBold,
                            ),
                          ),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
