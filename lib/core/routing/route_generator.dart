import 'package:go_router/go_router.dart';
import 'package:meals_app/core/routing/app_route.dart';
import 'package:meals_app/features/add_meals_screen/widget/add_meal_screen.dart';
import 'package:meals_app/features/home/model/meal_model.dart';
import 'package:meals_app/features/home/widget/home_screen.dart';
import 'package:meals_app/features/meal_details/widget/meal_details_screen.dart';
import 'package:meals_app/features/onboarding/widget/on_boarding_screen.dart';

class RouteGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoute.onboardingScreen,
    routes: [
      GoRoute(
        path: AppRoute.onboardingScreen,
        name: AppRoute.onboardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoute.homeScreen,
        name: AppRoute.homeScreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: AppRoute.mealDetailsScreen,
        name: AppRoute.mealDetailsScreen,
        builder: (context, state) {
          Meal meal = state.extra as Meal;
          return MealDetailsScreen(meal: meal);
        },
      ),
      GoRoute(
        path: AppRoute.addMealsScreen,
        name: AppRoute.addMealsScreen,
        builder: (context, state) => AddMealScreen(),
      ),
    ],
  );
}
