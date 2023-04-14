
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../ui/home/homescreen.dart';
import '../ui/massaging/massaging_view.dart';
import '../ui/my_order/myOrder_ui.dart';
import '../ui/profile/profile_view.dart';

class HomeViewModel extends GetxController {
  var _tabIndex = 0;
Widget _currentScreen=HomeScreen_view();
get currentScreen=>_currentScreen;
  get tabIndex =>_tabIndex;
  void changeTabIndex(int index) {
    _tabIndex = index;
    switch(index){
      case 0: {_currentScreen= HomeScreen_view(); break;}
      case 1: {_currentScreen= MyOrder_View(); break; }
      case 2: {_currentScreen= Massageing_View(); break; }
      case 3: {_currentScreen= Profile_view(); break; }

    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}