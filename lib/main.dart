import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pharmacy/utiles/binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Moduels/add_Drug/addDrug_View.dart';
import 'Moduels/auth/login/login_screen.dart';
import 'Moduels/auth/register/register_screen_ui.dart';
import 'Moduels/bottomNavigation_view.dart';
import 'Moduels/home/homescreen.dart';
import 'Moduels/massaging/massaging_view.dart';
import 'Moduels/my_order/myOrder_ui.dart';
import 'Moduels/profile/profile_view.dart';
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
            name: '/${MainPage_bottomNavigation.routeName}',
            page: () => MainPage_bottomNavigation()),
        GetPage(
            name: '/${HomeScreen_view.routeName}',
            page: () => HomeScreen_view()),
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
