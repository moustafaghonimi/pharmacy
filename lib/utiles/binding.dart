import 'package:get/get.dart';

import '../get_controler/authViewModel_Controller .dart';
import '../get_controler/bottom_navigation_controler.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => HomeViewModel());
  }
}
