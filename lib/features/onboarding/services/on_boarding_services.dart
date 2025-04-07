import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingServices {
  static late SharedPreferences sharedPreferences;

  static Future initializeSharedPref() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static bool isFirstTime() {
    return sharedPreferences.getBool("isFirstTime") ?? true;
  }

  static setFirstTimeWithFalse() {
    sharedPreferences.setBool("isFirstTime", false);
  }
}
