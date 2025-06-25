import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/utils.dart';
import 'package:shimmer/shimmer.dart';

class SubCategoryPage extends StatefulWidget {
  const SubCategoryPage({super.key});

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  int selectedIndex = 0;

  final List<Map<String, String>> sideCategories = [
    {"title": "Stationary", "image": "assets/sample/stationary.png"},
    {"title": "Snacks", "image": "assets/sample/SnaksCheetos.png"},
    {"title": "Frozen food", "image": "assets/sample/frozen.png"},
    {"title": "Stationary", "image": "assets/sample/stationary.png"},
  ];

  final List<Map<String, String>> categoryItems = [
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Vegetables', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: Row(
        children: [
          _buildSidePanel(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                itemCount: categoryItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = categoryItems[index];
                  return _buildProductItem(item);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSidePanel() {
    return Container(
      width: 100.w,
      color: Color(0xFFF7F7F7),
      child: ListView.builder(
        itemCount: sideCategories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          final item = sideCategories[index];
          return GestureDetector(
            onTap: () {
              setState(() => selectedIndex = index);
            },
            child: Container(
              color: isSelected ? Colors.white : Colors.transparent,
              child: Row(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: isSelected ? 5.w : 0,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6.r),
                        topRight: Radius.circular(6.r),
                      ),
                      color: isSelected ? Colors.orange : Colors.transparent,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 10.h,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            item['image']!,
                            height: 40.h,
                            width: 40.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            item['title']!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isSelected ? Colors.black : Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildProductItem(Map<String, String> item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF8B1E0D).withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              imageUrl: item["image"]!,
              height: 95.h,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => placeHolderWidget(height: 95.h),
              errorWidget: (context, url, error) => errorWidget(),
            ),
          ),
          SizedBox(height: 6.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["title"]!,
                  style: interTextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 11.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  item["weight"]!,
                  style: interTextStyle(
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xA3ED3F09).withOpacity(0.64),
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Text(
                      item["price"]!,
                      style: interTextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      item["oldPrice"]!,
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
                        border: Border.all(color: Color(0xFFED3F09)),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Text(
                        "ADD",
                        style: interTextStyle(
                          fontSize: 12.sp,
                          color: Color(0xFFED3F09),
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
