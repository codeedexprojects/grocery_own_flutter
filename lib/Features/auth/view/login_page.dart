import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/button.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:get/get.dart';
import 'package:grocery/Common/text_field_decoration.dart';
import 'package:grocery/Features/auth/view/verify_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // Handle continue button press
  void onContinuePressed() {
    Get.to(OTPVerifyPage());
    log("Continue button pressed");
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
            SizedBox(height: 170.h),
            Text(
              "LOG IN TO\nSHOP YOUR\nDAILY\nESSENTIALS",
              style: albertSansTextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            SizedBox(height: 40.h),

            // Name Field
            TextField(
              decoration: customInputDecoration(hint: "What's your name?"),
            ),
            SizedBox(height: 16.h),

            // Phone Number Field
            TextField(
              keyboardType: TextInputType.phone,
              decoration: customInputDecoration(
                prefixText: '+91 ',
                hint: 'Enter Phone Number',
              ),
            ),
            SizedBox(height: 28.h),

            // Continue Button
            commonButton(text: 'Continue', onPressed: onContinuePressed),

            SizedBox(height: 50.h),

            // OR Continue With
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "Or continue with",
                  style: TextStyle(fontSize: 12.sp),
                ),
              ),
            ),
            SizedBox(height: 16.h),

            // Google & Apple Logos
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/google.png", height: 36.h),
                SizedBox(width: 24.w),
                Image.asset("assets/icons/apple.png", height: 36.h),
              ],
            ),
            SizedBox(height: 120.h),

            // Terms and Policy
            Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Text.rich(
                  TextSpan(
                    text: 'By continuing, you agree to our ',
                    style: TextStyle(fontSize: 12.sp, color: Colors.black54),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(color: Colors.blue),
                      ),
                      const TextSpan(text: ' and '),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
