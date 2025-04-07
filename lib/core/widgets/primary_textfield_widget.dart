import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_colors.dart';
import 'package:meals_app/core/styling/app_style.dart';

class PrimaryTextfieldWidget extends StatelessWidget {
  final String? hintText;
  final double? width;
  final Widget? suffixIcon;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final int? maxLines;

  const PrimaryTextfieldWidget({
    super.key,
    this.hintText,
    this.width,
    this.suffixIcon,
    this.isPassword,
    this.controller,
    this.validator,
    this.inputType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 331.w,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        keyboardType: inputType ?? TextInputType.text,
        controller: controller,
        validator: validator,
        autofocus: false,
        cursorColor: AppColors.primary,
        obscureText: isPassword ?? false,
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: AppStyle.hintTextStyle,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 18.w,
            vertical: 18.w,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.primary, width: 1),
          ),
          filled: true,
          fillColor: AppColors.white,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
