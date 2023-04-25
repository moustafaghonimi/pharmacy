import 'package:flutter_zoom_drawer/config.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MyDrawerController extends GetxController {
  final zoomDrawerController = ZoomDrawerController();

  void toggleDrawer() {
    print("Toggle drawer");
    zoomDrawerController.toggle?.call();
    update();
  }
}
