import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/ui/home/homeScreen_Ui.dart';
import 'package:pharmacy/ui/login/login_screen.dart';
import 'package:pharmacy/ui/register/register_screen_ui.dart';
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
            name: '/${HomeScreen_UI.routeName}', page: () => HomeScreen_UI()),
      ],
    );
  }
}
