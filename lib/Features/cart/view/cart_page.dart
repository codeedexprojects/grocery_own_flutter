import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/app_bar.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Common/fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool isLoading = true;

  final List<Map<String, dynamic>> cartItems = [
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
    {
      "title": "Pumpkin",
      "weight": "500 g",
      "price": 89,
      "quantity": 2,
      "image":
          "https://assets.clevelandclinic.org/transform/LargeFeatureImage/cd71f4bd-81d4-45d8-a450-74df78e4477a/Apples-184940975-770x533-1_jpg",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange-thumbnail.png",
    },
    {
      "title": "Watermelon",
      "weight": "500 g",
      "price": 89,
      "quantity": 1,
      "image":
          "https://w7.pngwing.com/pngs/467/70/png-transparent-sliced-watermelon-fruit-mudslide-watermelon-graphy-fruit-watermelon-food-melon-fruit-nut-thumbnail.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: normaAppBar(title: "My Cart", backButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Expanded(
              child: isLoading
                  ? ListView.separated(
                      itemCount: 4,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (_, __) => _buildShimmerItem(),
                    )
                  : ListView.separated(
                      itemCount: cartItems.length,
                      separatorBuilder: (_, __) => SizedBox(height: 12.h),
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return _buildCartItem(
                          item["title"],
                          item["weight"],
                          item["price"],
                          item["quantity"],
                          item["image"],
                        );
                      },
                    ),
            ),
            _buildTotalCheckout(total: 549),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                // Image Placeholder
                Container(
                  height: 80.h,
                  width: 90.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                ),
                SizedBox(width: 12.w),

                // Text Placeholder
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 60.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 14.h,
                          width: 100.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 6.h),
                        Container(
                          height: 12.h,
                          width: 60.w,
                          color: Colors.white,
                        ),
                        SizedBox(height: 6.h),
                        Container(
                          height: 14.h,
                          width: 50.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Top Right - Close Icon Placeholder
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 20.sp,
                height: 20.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Bottom Right - Quantity Box Placeholder
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 30.h,
                width: 70.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCartItem(
    String title,
    String weight,
    int price,
    int quantity,
    String imagePath,
  ) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.primarySoft,
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
                  height: 80.h,
                  width: 90.h,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      Container(color: Colors.grey[200]),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: 60.w,
                  ), // Space for quantity box
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        weight,
                        style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "₹$price",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Close Icon - Top Right
          Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.close, size: 20.sp),
            ),
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

  Widget _buildTotalCheckout({required int total}) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.secondary, width: 1.h),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: Text(
                (isLoading) ? "Total : ₹---" : "Total : ₹$total",
                style: interTextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            decoration: BoxDecoration(
              color: AppColors.secondary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.r),
                bottomRight: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: Text(
                "Checkout",
                style: interTextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
