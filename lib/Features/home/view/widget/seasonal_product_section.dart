import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:grocery/Common/utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SeasonalProductsSection extends StatelessWidget {
  const SeasonalProductsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = PageController(viewportFraction: 0.85);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Seasonal Products",
          style: interTextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.h),
        Container(
          height: 270.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images5.alphacoders.com/136/1364887.png',
              ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Stack(
            children: [
              // Gradient shadow overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.5),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),

              // Product list + indicator
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 110.h,
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        scrollDirection: Axis.horizontal,
                        controller: pageController,
                        itemCount: 5,
                        separatorBuilder: (context, index) =>
                            SizedBox(width: 12.w),
                        itemBuilder: (context, index) {
                          return _buildProduct(
                            "Seasonal Fruit $index",
                            "1 kg",
                            100 + index * 10,
                            1 + index,
                            1 + index * 2,
                            'https://deyga.in/cdn/shop/articles/mangoes-cover-1.jpg?v=1617118328',
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SmoothPageIndicator(
                      controller: pageController,
                      count: 5,
                      effect: ExpandingDotsEffect(
                        dotHeight: 6.w,
                        dotWidth: 6.w,
                        activeDotColor: Colors.white,
                        dotColor: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProduct(
    String title,
    String weight,
    int offerPrice,
    int originalPrice,
    int quantity,
    String imagePath,
  ) {
    return Container(
      width: 300.w,
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Stack(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.r),
                child: CachedNetworkImage(
                  imageUrl: imagePath,
                  height: 100.h,
                  width: 100.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      placeHolderWidget(height: 95.h),
                  errorWidget: (context, url, error) => errorWidget(),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(2.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: interTextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 2.h),
                      Text(weight, style: interTextStyle(fontSize: 12.sp)),
                      SizedBox(height: 2.h),
                      Text(
                        "₹$offerPrice",
                        style: interTextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "₹$originalPrice",
                        style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Quantity Box - Bottom Right
          Positioned(bottom: 0, right: 0, child: _buildQuantityBox(quantity)),
        ],
      ),
    );
  }

  Widget _buildQuantityBox(int quantity) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        children: [
          Icon(Icons.remove, size: 16.sp),
          SizedBox(width: 6.w),
          Text(
            "$quantity",
            style: poppinsTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 6.w),
          Icon(Icons.add, size: 16.sp),
        ],
      ),
    );
  }
}
