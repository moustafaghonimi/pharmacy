import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/Moduels/bottomNavigation_view.dart';

class AuthMiddleWare extends GetMiddleware{

  @override
  RouteSettings? redirect(String? route){
    if(sharedPref!.getString("token") !=null)
      return RouteSettings(name:"/${MainPage_bottomNavigation.routeName}" );
  }
}