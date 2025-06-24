import 'package:get/get.dart';

class BottomBarTabIndex extends GetxController {
  // Observable index
  RxInt currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
