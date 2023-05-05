
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pharmacy/Moduels/home/homescreen.dart';

import '../get_controler/drawerr_contoler.dart';

class Drawerr_screen extends GetView<MyDrawerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      builder: (_) => ZoomDrawer(
        controller: _.zoomDrawerController,
        menuScreen: MenuScreen(),
        mainScreen: HomeScreen_view(),
        
        androidCloseOnBackTap: true,
        moveMenuScreen: true,
        overlayBlur: 0.4,
        borderRadius: 28.0,
        showShadow: true,
        angle: -12.0,
        drawerShadowsBackgroundColor: Colors.grey,

        slideWidth: MediaQuery.of(context).size.width * 0.8,
      ),
    );
  }
}

class MenuScreen extends GetView<MyDrawerController> {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //items
    return Container(

      color: Colors.yellow,
    );
  }
}

