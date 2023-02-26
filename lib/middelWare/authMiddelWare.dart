import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/ui/home/homeScreen_Ui.dart';

class AuthMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route){
    if(sharedPref!.getString("token") !=null)
      return RouteSettings(name:"/${HomeScreen_UI.routeName}" );
  }
}