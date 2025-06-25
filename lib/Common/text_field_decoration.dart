import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Common/fonts.dart';

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

InputDecoration customSearchInputDecoration({String? hint}) {
  return InputDecoration(
    hintText: hint,
    hintStyle: interTextStyle(fontSize: 14.sp, color: Color(0xFFC4C4C4)),
    prefixIcon: Icon(Icons.search, color: Color(0xFFC4C4C4), size: 25.sp),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.r),
      borderSide: BorderSide(color: Colors.grey.shade300),
    ),
  );
}
