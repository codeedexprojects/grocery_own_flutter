import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/utils.dart';

class SnacksAndDrinksSection extends StatelessWidget {
  SnacksAndDrinksSection({super.key});

  final List<Map<String, String>> snacksAndDrinks = [
    {
      "title": "Pumpkin Kilo",
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon Biskcket",
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",

      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",

      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",

      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon Biskcket",

      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Watermelon",

      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon Biskcket",

      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Watermelon",

      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon Biskcket",

      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Snacks and Drinks",
          style: interTextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        SizedBox(
          height: 220.h,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snacksAndDrinks.length,
            padding: EdgeInsets.only(right: 12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 rows
              mainAxisSpacing: 0.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 1.1,
            ),
            itemBuilder: (context, index) {
              return _buildCategoryItem(snacksAndDrinks[index]);
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
