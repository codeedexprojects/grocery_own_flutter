import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/colors.dart';

InputDecoration customInputDecoration({String? hint, String? prefixText}) {
  return InputDecoration(
    prefixText: prefixText,
    prefixStyle: TextStyle(color: Colors.black, fontSize: 14.sp),
    hintText: hint,
    hintStyle: TextStyle(fontSize: 14.sp, color: Colors.black54),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(8.r),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.primary),
      borderRadius: BorderRadius.circular(8.r),
    ),
  );
}
