import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery/Common/colors.dart';
import 'package:grocery/Features/bottom%20bar/view%20model/tab_index_view_model.dart';
import 'package:grocery/Features/cart/view/cart_page.dart';
import 'package:grocery/Features/category/view/category_page.dart';
import 'package:grocery/Features/home/view/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final vmodel = Get.put(BottomBarTabIndex());

    final List<Widget> screens = const [HomePage(), CategoryPage(), CartPage()];

    return Obx(
      () => Scaffold(
        body: screens[vmodel.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          currentIndex: vmodel.currentIndex.value,
          onTap: vmodel.changeTab,
          items: [
            _buildBarItem(
              iconPath: 'assets/icons/home.svg',
              label: 'Home',
              isSelected: vmodel.currentIndex.value == 0,
            ),
            _buildBarItem(
              iconPath: 'assets/icons/category.svg',
              label: 'Category',
              isSelected: vmodel.currentIndex.value == 1,
            ),
            _buildBarItem(
              iconPath: 'assets/icons/cart.svg',
              label: 'Cart',
              isSelected: vmodel.currentIndex.value == 2,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem({
    required String iconPath,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        iconPath,
        height: 20.sp,
        width: 20.sp,
        colorFilter: ColorFilter.mode(
          isSelected ? AppColors.primary : Colors.black,
          BlendMode.srcIn,
        ),
      ),

      label: label,
    );
  }
}
