import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;

  PageController pageController = PageController();
  ///Cambia la página actual
  void changePage(int index) {
    currentIndex.value = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeIn,
    );
  }
}
