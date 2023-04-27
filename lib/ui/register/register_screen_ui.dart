import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy/api/api_manger.dart';
import 'package:pharmacy/ui/login/login_screen.dart';

import '../../core/appColor.dart';
import '../../main.dart';
import '../../shared/componant/ui_utlis.dart';
import '../bottomNavigation_view.dart';
import '../widgets/custemButton.dart';
import '../widgets/custemTextFormFiled.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'routename';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();
  var email_Controller = TextEditingController();
  var password_Controller = TextEditingController();
  var PharmacyName_Controller = TextEditingController();
  var PharmacyID_Controller = TextEditingController();
  var city_controller = TextEditingController();
  var village_controller = TextEditingController();
  var phone_controller = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign Up',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/login_icon.png',
            width: 100,
          ),
          SizedBox(
            height: h / 40,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustemTextFormFiled(
                        'Pharmacy Title',
                        'Pharmacy Name',
                        icons: IconButton(
                          icon: Icon(Icons.title),
                          onPressed: () {},
                        ),
                        controllers: PharmacyName_Controller,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Pharmacy Name is required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'Pharmacy ID',
                        'Pharmacy ID',
                        icons: IconButton(
                          icon: Icon(Icons.confirmation_num_outlined),
                          onPressed: () {},
                        ),
                        controllers: PharmacyID_Controller,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Pharmacy ID is required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'City ',
                        'City',
                        icons: IconButton(
                          icon: Icon(Icons.location_city),
                          onPressed: () {},
                        ),
                        controllers: city_controller,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'City name Required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'Village ',
                        'Village',
                        icons: IconButton(
                          icon: Icon(Icons.holiday_village),
                          onPressed: () {},
                        ),
                        controllers: village_controller,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Village name Required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'PHONE ',
                        'Phone',
                        icons: IconButton(
                          icon: Icon(Icons.phone),
                          onPressed: () {},
                        ),
                        keybordtype: TextInputType.phone,
                        controllers: phone_controller,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Village name Required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'Enter your Email',
                        'Email',
                        icons: IconButton(
                          icon: Icon(Icons.email),
                          onPressed: () {},
                        ),
                        controllers: email_Controller,
                        keybordtype: TextInputType.emailAddress,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email not validate';
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (!emailValid) {
                            return 'Please Enter Valid Email';
                          }
                          return null;
                        },
                      ),
                      CustemTextFormFiled(
                        'Enter your Password',
                        'Password',
                        icons: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        ),
                        controllers: password_Controller,
                        hideText: passwordVisible ? true : false,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password not validate';
                          }
                        },
                      ),
                      Container(
                        width: w * 0.9,
                        child: CustemButton(
                          callBack: () {
                            print(email_Controller);
                            print(password_Controller);
                            return login_validation();
                          },
                          text: 'Sign Up',
                          buttonColor: AppColor.PrimaryColor,
                          buttonRedias: 10,
                          textColor: AppColor.BlackColor,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("I Have an account?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54)),
                          TextButton(
                              onPressed: () {
                                Get.to(LoginScreen_UI());
                              },
                              child: Text("Sign in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: AppColor.OnPrimaryColor))),
                        ],
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }

  void login_validation() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);
    try {
      var response = await API_Manger.register(PharmacyName_Controller.text,
          email_Controller.text, password_Controller.text);
      hideMassage(context);
      if (response.token == null) {
        showMasage(context, response.msg ?? 'Email is used', 'ok', () {
          Get.back();
        });
        return;
      }
      sharedPref!.setString("token", response.token??"token null");

      Get.offAll(()=>MainPage_bottomNavigation());
      // showMasage(context, response.token ?? 'token null', 'ok', () {
      //   Get.back();
      // });
      print(response.token);
    } catch (e) {
      hideMassage(context);
      print(e);
      showMasage(context, 'Check Internet and Try Again ------> ${e}', 'OK',
          () {
        Get.back();
      });
    }
  }
}
