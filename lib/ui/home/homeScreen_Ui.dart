import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/appColor.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/ui/login/login_screen.dart';

class HomeScreen_UI extends StatelessWidget {
static const String routeName='home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.PrimaryColor,
        title: Text('Home'),
        actions: [
          IconButton(onPressed: () {
            if(sharedPref==null){
              Get.off(LoginScreen_UI());
              return;
            }
            sharedPref!.clear();
            Get.off(LoginScreen_UI());
          }, icon: Icon(Icons.logout))
        ],
      ),

    );
  }
}
