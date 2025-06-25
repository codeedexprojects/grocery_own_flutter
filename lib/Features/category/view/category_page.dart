import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:grocery/Common/app_bar.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/utils.dart';
import 'package:grocery/Features/category/view/sub_category_page.dart';
import 'package:shimmer/shimmer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
        "title": "Pumpkin",

        "image":
            "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
      },
      {
        "title": "Watermelon",

        "image":
            "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: normaAppBar(
        title: "Categories",
        backButton: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 28.sp),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),

            // Grocery and Kitchen
            Text(
              "Grocery and kitchen",
              style: interTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            isLoading ? _buildShimmerGrid() : _buildGrid(groceryAndKitchen),

            SizedBox(height: 16.h),
            // Snacks and Drinks
            Text(
              "Snacks & Drinks",
              style: interTextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 12.h),
            isLoading ? _buildShimmerGrid() : _buildGrid(snacksAndDrinks),
          ],
        ),
      ),
    );
  }

  Widget _buildGrid(List<Map<String, String>> items) {
    return GridView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = items[index];
        return GestureDetector(
          onTap: () {
            Get.to(() => SubCategoryPage());
          },
          child: _buildCategoryItem(item),
        );
      },
    );
  }

  Widget _buildCategoryItem(Map<String, String> item) {
    return Column(
      children: [
        Container(
          height: 60.h,
          width: 60.h,
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
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildShimmerGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 8,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 12.w,
        mainAxisSpacing: 12.h,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (_, __) {
        return Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 60.h,
                width: 60.h,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(height: 12.h, width: 50.w, color: Colors.grey),
            ),
          ],
        );
      },
    );
  }
}
