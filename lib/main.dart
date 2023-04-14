import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ui/add_Drug/addDrug_View.dart';
import 'package:pharmacy/ui/bottomNavigation_view.dart';
import 'package:pharmacy/ui/home/homescreen.dart';
import 'package:pharmacy/ui/login/login_screen.dart';
import 'package:pharmacy/ui/massaging/massaging_view.dart';
import 'package:pharmacy/ui/my_order/myOrder_ui.dart';
import 'package:pharmacy/ui/profile/profile_view.dart';
import 'package:pharmacy/ui/register/register_screen_ui.dart';
import 'package:pharmacy/utiles/binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'middelWare/authMiddelWare.dart';

SharedPreferences? sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginScreen_UI.routeName,
      getPages: [
        GetPage(
            name: '/${LoginScreen_UI.routeName}',
            page: () => LoginScreen_UI(),
            middlewares: [
              AuthMiddleWare(),
            ]),
        GetPage(
            name: '/${RegisterScreen.routeName}', page: () => RegisterScreen()),
        GetPage(
            name: '/${MainPage_bottomNavigation.routeName}', page: () => MainPage_bottomNavigation()),
        GetPage(
            name: '/${HomeScreen_view.routeName}', page: () => HomeScreen_view()),
        GetPage(name: '/${MyOrder_View.routeName}', page: () => MyOrder_View()),
        GetPage(
          name: '/${Massageing_View.routeName}',
          page: () => Massageing_View(),
        ),
        GetPage(name: '/${Profile_view.routeName}', page: () => Profile_view()),
        GetPage(
          name: '/${AddDrug_view.routeName}',
          page: () => AddDrug_view(),
        ),
      ],
    );
  }
}
