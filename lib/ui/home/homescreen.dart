import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/appColor.dart';
import '../../main.dart';
import '../login/login_screen.dart';

class HomeScreen_view extends StatelessWidget {
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                if (sharedPref == null) {
                  Get.offAll(LoginScreen_UI());
                  return;
                }
                sharedPref!.clear();
                Get.offAll(LoginScreen_UI());
              },
              icon: Icon(Icons.logout))
        ],
      ),


    );
  }
}
