import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Common/fonts.dart';

class MonthlyEssentialSaleSection extends StatelessWidget {
  MonthlyEssentialSaleSection({Key? key}) : super(key: key);

  final List<Map<String, String>> orderAgainItems = [
    {
      "title": "Tomato (Thakkali)",
      "weight": "500g",
      "price": "₹19",
      "oldPrice": "₹25",
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Potato (Kizhangu)",
      "weight": "500g",
      "price": "₹49",
      "oldPrice": "₹65",
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Onion (Savala)",
      "weight": "500g",
      "price": "₹49",
      "oldPrice": "₹65",
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Carrot",
      "weight": "500g",
      "price": "₹49",
      "oldPrice": "₹65",
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Monthly Essentials Sale",
              style: interTextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'see all',
              style: GoogleFonts.inter(
                color: Colors.grey,
                decoration: TextDecoration.underline,
                decorationColor: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 180.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: orderAgainItems.length,
            separatorBuilder: (context, index) => SizedBox(width: 12.w),
            itemBuilder: (context, index) {
              final item = orderAgainItems[index];
              return _buildProductItem(item);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(Map<String, String> item) {
    return Container(
      width: 150.w,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.10),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Container(
              color: Color(0xFFFFD45C),
              child: CachedNetworkImage(
                imageUrl: item["image"] ?? '',
                height: 95.h,
                width: double.infinity,
                fit: BoxFit.cover,
                // placeholder: (context, url) => placeHolderWidget(height: 95.h),
                // errorWidget: (context, url, error) => errorWidget(),
              ),
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"] ?? 'Unknown Item',
                  style: interTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  item["weight"] ?? '300g',
                  style: interTextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      item["price"] ?? '₹0',
                      style: interTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      item["oldPrice"] ?? '₹0',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        "ADD",
                        style: interTextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
