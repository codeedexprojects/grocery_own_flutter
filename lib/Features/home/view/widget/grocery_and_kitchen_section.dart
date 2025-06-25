import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/utils.dart';

class GroceryAndKitchenSection extends StatelessWidget {
  GroceryAndKitchenSection({super.key});

  final List<Map<String, String>> groceryAndKitchen = [
    {"title": "Frozen food", "image": "assets/sample/frozen.png"},
    {"title": "Stationary", "image": "assets/sample/stationary.png"},
    {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
    {"title": "Frozen food", "image": "assets/sample/frozen.png"},
    {"title": "Stationary", "image": "assets/sample/stationary.png"},
    {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
    {"title": "Frozen food", "image": "assets/sample/frozen.png"},
    {"title": "Stationary", "image": "assets/sample/stationary.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Grocery and Kitchen",
          style: interTextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 220.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: groceryAndKitchen.length,
            padding: EdgeInsets.only(right: 12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 rows
              mainAxisSpacing: 0.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return _buildCategoryItem(groceryAndKitchen[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(Map<String, String> item) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 70.h,
          width: 70.h,
          padding: EdgeInsets.all(6.w),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF1C8),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: item["image"]!.startsWith('http')
              ? CachedNetworkImage(
                  imageUrl: item["image"]!,
                  fit: BoxFit.contain,
                  placeholder: (context, url) =>
                      placeHolderWidget(height: 60.h),
                  errorWidget: (context, url, error) => errorWidget(),
                )
              : Image.asset(item["image"]!, fit: BoxFit.contain),
        ),
        SizedBox(height: 6.h),
        Text(
          item["title"]!,
          style: interTextStyle(fontSize: 12.sp),
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
