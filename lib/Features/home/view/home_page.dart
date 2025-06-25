import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/text_field_decoration.dart';
import 'package:grocery/Features/home/view/widget/category_section.dart';
import 'package:grocery/Features/home/view/widget/grocery_and_kitchen_section.dart';
import 'package:grocery/Features/home/view/widget/monthly_essential_sale_section.dart';
import 'package:grocery/Features/home/view/widget/order_again_section.dart';
import 'package:grocery/Features/home/view/widget/running_text_banner.dart';
import 'package:grocery/Features/home/view/widget/seasonal_product_section.dart';
import 'package:grocery/Features/home/view/widget/snacks_and_drinks_section.dart';
import 'package:grocery/Features/home/view/widget/this_month_must_have.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:marquee/marquee.dart';

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
      if (!mounted) return; // prevents calling setState after dispose
      setState(() => isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              CategorySection(isLoading: isLoading),
              SizedBox(height: 20.h),
              isLoading
                  ? _shimmerBanner()
                  : RunningBanner(
                      bannerImage: "assets/sample/banner1.jpg",
                      bannerText:
                          "Enjoy FREE Delivery on all orders from 4 PM to 5 PM — don’t miss out!",
                    ),
              SizedBox(height: 20.h),
              OrderAgainList(),
              SizedBox(height: 20.h),
              // Grocery & Kitchen
              GroceryAndKitchenSection(),
              SizedBox(height: 20.h),
              //Snacks & Drinks
              SnacksAndDrinksSection(),
              SizedBox(height: 20.h),
              // Seasonal Products
              SeasonalProductsSection(),
              SizedBox(height: 20.h),
              // Monthly Esssential Sale
              MonthlyEssentialSaleSection(),
              SizedBox(height: 20.h),
              ThisMonthMustHave(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/icons/person.png',
                  width: 24.w,
                  height: 24.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Delivery in 10 mins",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
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
      onChanged: (value) {
        // Handle search input changes
      },
      decoration: customSearchInputDecoration(hint: "Search for products"),
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

  Widget _buildDotsIndicator() {
    return Center(
      child: SmoothPageIndicator(
        controller: PageController(),
        count: 3,
        effect: const ExpandingDotsEffect(
          dotWidth: 8.0,
          dotHeight: 8.0,
          activeDotColor: AppColors.primary,
          dotColor: Colors.grey,
        ),
        onDotClicked: (index) {
          // Handle dot click
        },
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
}
