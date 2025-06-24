import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery/Common/button.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Features/bottom%20bar/view/bottom_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerifyPage extends StatelessWidget {
  const OTPVerifyPage({super.key});

  // Handle verify button press
  onVerifyPressed() {
    Get.to(BottomBar());
    log("Verify button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 90.h),
            Text(
              "VERIFY\nDETAILS",
              style: albertSansTextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "We've sent a 6-digit code to your number",
              style: albertSansTextStyle(fontSize: 15.sp),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "ENTER OTP",
                style: albertSansTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  activeColor: Colors.orange,
                  selectedColor: Colors.orange,
                  inactiveColor: Colors.orange.shade200,
                  shape: PinCodeFieldShape.underline,
                  fieldHeight: 50.h,
                  fieldWidth: 40.w,
                ),
                onChanged: (value) {},
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Text(
                "Didn't receive the OTP? Retry in 00:30",
                style: albertSansTextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
            ),
            SizedBox(height: 40.h),
            // Verify Button
            commonButton(text: "Verify to proceed", onPressed: onVerifyPressed),
          ],
        ),
      ),
    );
  }
}
