import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;

  ///Cambia la página actual
  void changePage(int index) {
    currentIndex.value = index;
  }
}
