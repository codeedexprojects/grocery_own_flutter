import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/colors.dart';

Widget commonButton({
  required String text,
  required VoidCallback onPressed,
  Color backgroundColor = AppColors.buttonColor,
  Color textColor = Colors.black,
  double fontSize = 16,
  double height = 48,
  double borderRadius = 8,
}) {
  return SizedBox(
    width: double.infinity,
    height: height.h,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius.r),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
