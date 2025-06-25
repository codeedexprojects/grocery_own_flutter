import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:shimmer/shimmer.dart';

class CategorySection extends StatelessWidget {
  final bool isLoading;

  const CategorySection({super.key, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {"title": "Fruits", "image": "assets/sample/Fruits.png"},
      {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
      {"title": "Frozen food", "image": "assets/sample/frozen.png"},
      {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
      {"title": "Frozen food", "image": "assets/sample/frozen.png"},
      {"title": "Stationary", "image": "assets/sample/stationary.png"},
      {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
      {"title": "Frozen food", "image": "assets/sample/frozen.png"},
      {"title": "Stationary", "image": "assets/sample/stationary.png"},
      {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
      {"title": "Frozen food", "image": "assets/sample/frozen.png"},
      {"title": "Stationary", "image": "assets/sample/stationary.png"},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Categories",
          style: interTextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 100.h,
          child: isLoading
              ? _shimmerCategoryList()
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return _buildCategoryItem(
                      category["title"]!,
                      category["image"]!,
                    );
                  },
                ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(String title, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 12.w),
      child: Column(
        children: [
          Container(
            height: 70.h,
            width: 70.h,
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEAA5),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          SizedBox(height: 4.h),
          Text(
            title,
            style: interTextStyle(fontSize: 12.sp),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _shimmerCategoryList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 70.h,
                width: 70.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(width: 50.w, height: 10.h, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
