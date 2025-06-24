import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery/Common/fonts.dart';

AppBar normaAppBar({
  required String title,
  List<Widget> actions = const [],
  Color backgroundColor = Colors.white,
  bool backButton = true,
  double elevation = 0.0,
}) {
  return AppBar(
    title: Text(
      title,
      style: interTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
    ),
    leading: backButton
        ? IconButton(
            icon: Icon(Icons.arrow_back_ios, size: 24.sp),
            onPressed: () => Get.back(),
          )
        : null,
    backgroundColor: backgroundColor,
    actions: actions,
    automaticallyImplyLeading: false,
    elevation: elevation,
    scrolledUnderElevation: 0,
  );
}
