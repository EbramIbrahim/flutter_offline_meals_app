import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/routing/route_generator.dart';
import 'package:meals_app/features/onboarding/services/on_boarding_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await OnBoardingServices.initializeSharedPref();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, childe) {
        return MaterialApp.router(
          title: 'Meals app',
          routerConfig: RouteGenerator.goRouter,
        );
      },
    );
  }
}
