import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meals_app/core/styling/app_style.dart';

class SubFoodCardItem extends StatelessWidget {
  final String icon;
  final String text;
  const SubFoodCardItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(icon),
        const SizedBox(width: 4),
        Text(text, style: AppStyle.black16Medium.copyWith(fontSize: 12.sp)),
      ],
    );
  }
}
