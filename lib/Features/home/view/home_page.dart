import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/colors.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() => isLoading = false);
    });
  }

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              _buildHeader(),
              SizedBox(height: 16.h),
              _buildSearchField(),
              SizedBox(height: 16.h),
              isLoading ? _shimmerBanner() : _mainBanner(),
              SizedBox(height: 12.h),
              _buildDotsIndicator(),
              SizedBox(height: 20.h),
              Text(
                "Categories",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
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
              SizedBox(height: 20.h),
              isLoading ? _shimmerBanner() : _secondBanner(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Icon(Icons.person_pin, size: 24.sp),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Delivery in 10 mins",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Text(
                  "2972 Cherpulassery .kerala 6795...",
                  style: TextStyle(fontSize: 14.sp),
                ),
                Icon(Icons.arrow_drop_down, size: 20.sp),
              ],
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.orange),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(Icons.shopping_cart_outlined),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search your product',
        prefixIcon: Icon(Icons.search),
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
      ),
    );
  }

  Widget _mainBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(
        "assets/sample/offer.png",
        height: 180.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _secondBanner() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Image.asset(
        "assets/sample/banner1.jpg",
        height: 180.h,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              Icons.circle,
              size: 6.sp,
              color: index == 0 ? Colors.green : Colors.grey.shade300,
            ),
          ),
        ),
      ),
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
          Text(title, style: TextStyle(fontSize: 12.sp)),
        ],
      ),
    );
  }

  Widget _shimmerBanner() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 180.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
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
