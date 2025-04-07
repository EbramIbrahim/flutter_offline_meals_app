import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/core/styling/app_colors.dart';

class AppStyle {
  static TextStyle onBoardingTitleStyle = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle onBoardingDescStyle = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle white14spSemiBold = GoogleFonts.inter(
    color: AppColors.white,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle black16Medium = GoogleFonts.inter(
    color: AppColors.black,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle gray14spMedium = GoogleFonts.inter(
    color: AppColors.gray,
    fontSize: 14.sp,
    fontWeight: FontWeight.normal,
  );

  static TextStyle hintTextStyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.gray,
  );
}
