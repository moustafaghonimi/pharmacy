import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/appColor.dart';
import '../../../repositorie/data_source/remote.dart';
import '../../../shared/componant/ui_utlis.dart';
import '../../../shared/network/remote/api_manger.dart';
import '../../bottomNavigation_view.dart';
import '../../widgets/custemButton.dart';
import '../../widgets/custemText.dart';
import '../../widgets/custemTextFormFiled.dart';
import '../login/login_screen.dart';


class RegisterScreen extends StatefulWidget {
  static const String routeName = 'routename';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var repo=Repo(baseRepositorie: Remote());
  var formKey = GlobalKey<FormState>();
  var PharmacyID_Controller = TextEditingController();
  var Pharmacyname_Controller = TextEditingController();
  var userNameControler = TextEditingController();
  var firestNameControler = TextEditingController();
  var lastNameControler = TextEditingController();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var cpasswordControler = TextEditingController();
  var ageControler = TextEditingController();
  var phone_controller = TextEditingController();
  bool passwordVisible = true;
  bool cpasswordVisible = true;



  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
  var repo=Repo(baseRepositorie: Remote());

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
                        controllers: Pharmacyname_Controller,
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
                        'User Name ',
                        'User Name ',
                        icons: IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () {},
                        ),
                        controllers: userNameControler,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'user name Required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'First Name',
                        'First Name',
                        icons: IconButton(
                          icon: Icon(Icons.looks_one),
                          onPressed: () {},
                        ),
                        controllers: firestNameControler,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'First name Required';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'Last Name',
                        'Last Name',
                        icons: IconButton(
                          icon: Icon(Icons.looks_two),
                          onPressed: () {},
                        ),
                        controllers: lastNameControler,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Last name Required';
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
                        'Age ',
                        'Age',
                        icons: IconButton(
                          icon: Icon(Icons.numbers),
                          onPressed: () {},
                        ),
                        keybordtype: TextInputType.number,
                        controllers: ageControler,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Your Age Required';
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
                        controllers: emailControler,
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
                        controllers: passwordControler,
                        hideText: passwordVisible ? true : false,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password not validate';
                          }
                        },
                      ),
                      CustemTextFormFiled(
                        'Enter Re Password',
                        'Re Password',
                        icons: IconButton(
                          icon: Icon(
                            // Based on passwordVisible state choose the icon
                            cpasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            // Update the state i.e. toogle the state of passwordVisible variable
                            setState(() {
                              cpasswordVisible = !cpasswordVisible;
                            });
                          },
                        ),
                        controllers: cpasswordControler,
                        hideText: cpasswordVisible ? true : false,
                        validate: (value) {
                          if (value == null || value.trim().isEmpty) {
                            if(passwordVisible!=cpasswordVisible){
                              return 'two password not same ';
                            }
                            return 'Re Password not validate';
                          }
                        },
                      ),
                      Container(
                        width: w * 0.9,
                        child: CustemButton(
                          callBack: () {

                            return register_validation();
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

  void register_validation() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);
    try {
      var response = await repo.baseRepositorie?.register(
          PharmacyID_Controller.text,
          Pharmacyname_Controller.text,
          userNameControler.text,
          firestNameControler.text,
          lastNameControler.text,
          emailControler.text,
        passwordControler.text,
        cpasswordControler.text,
        ageControler.text,
          phone_controller.text
      );
      hideMassage(context);


      if (response?.message != null&&response?.message=='User added successfully') {
        showMasage(
            context, "${response?.message}\n${response?.Error}" , 'OK',
                () {
              Get.back();
            });
        Get.snackbar('message', response!.Error.toString());
        return;
      }
      if (response?.user != null ) {
        Get.snackbar('token', response?.user??"");
      }
      // sharedPref!.setString("token", authorization?.token ?? "token null");
      // print(sharedPref);
      // showMasage(context, response.token??'', 'ok', () {Get.back(); });
      Get.off(() => LoginScreen_UI());

    } catch (e) {
      // hideMassage(context);
      print(e);
      Get.snackbar('error', e.toString());
    }
  }

}
