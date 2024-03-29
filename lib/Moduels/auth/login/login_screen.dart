import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/shared/componant/ui_utlis.dart';

import '../../../core/appColor.dart';
import '../../../repositorie/data_source/remote.dart';
import '../../../shared/network/remote/api_manger.dart';
import '../../bottomNavigation_view.dart';
import '../../widgets/custemButton.dart';
import '../../widgets/custemText.dart';
import '../../widgets/custemTextFormFiled.dart';
import '../otp/otp_email.dart';
import '../register/register_screen_ui.dart';



class LoginScreen_UI extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen_UI> createState() => _LoginScreen_UIState();
}

class _LoginScreen_UIState extends State<LoginScreen_UI> {
  var formKey = GlobalKey<FormState>();
  var repo=Repo(baseRepositorie: Remote());
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
  var PharmacyID_Controller = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.PrimaryColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 35.0, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/appbar_login_icone.png',
                  width: 60,
                ),
                Image.asset(
                  'assets/images/cart_icon.png',
                  width: 60,
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * .02,
          ),
          CustemText(
              Txt: 'Drugerr App',
              color: AppColor.OnPrimaryColor,
              size: 60,
              fontWeight: FontWeight.bold),
          SizedBox(
            height: h * .055,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Colors.white),
              width: double.infinity,
              height: h * 0.62,
              child: Column(
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
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 180.0, bottom: 10),
                                  child: InkWell(
                                    hoverColor: AppColor.PrimaryColor,
                                    onTap: () {
                                     Get.to( Otp_BY_Email());
                                    },
                                    child: Text('Forgot Password?',
                                        style: TextStyle(color: Colors.black)),
                                  )),
                              Container(
                                width: w * 0.9,
                                child: CustemButton(
                                 callBack: () {

                                    return login_validation();
                                  },
                                 text: 'Sign In',
                                  buttonColor: AppColor.PrimaryColor,
                                  buttonRedias: 10,
                                  textColor: AppColor.WhaitColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  CustemText(
                                      Txt: "Don't have an account?",
                                      color:Colors.black54,
                                      fontWeight: FontWeight.bold, size: 15,),
                                 
                                  TextButton(
                                    onPressed: () {
                                      Get.to(RegisterScreen());
                                    },
                                    child: CustemText(
                                        Txt: 'Sign up',
                                        color: AppColor.OnPrimaryColor,
                                        size: 16,
                                        fontWeight: FontWeight.bold),
                                  ),

                                ],
                              ),
                              Divider(color: AppColor.BlackColor,height: 5,indent: 16,endIndent: 16,thickness: 1,),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                CustemText(
                                  Txt: "If Have A problem!",
                                  color:AppColor.BlackColor,
                                  fontWeight: FontWeight.bold, size: 15,),

                                TextButton(
                                  onPressed: () {
                                    // Get.to(RegisterScreen());
                                  },
                                  child: CustemText(
                                      Txt: 'Call Admins',
                                      color: AppColor.OnPrimaryColor,
                                      size: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],)

                            ],
                          )),
                    ),
                  )
                ],
              ),
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
      var response = await repo.baseRepositorie?.login(
          PharmacyID_Controller.text,
        emailControler.text,
        passwordControler.text
      );
      hideMassage(context);

      var authorization=response?.authorization;

      if (response?.message != null && response?.message!='Logged in successfully') {
        showMasage(
            context, response?.message ?? "Email OR Password not correct !", 'OK',
                () {
              Get.back();
            });
        Get.snackbar('message', response!.message.toString());
return;
      }
      if (authorization?.token != null ) {
        Get.snackbar('token', authorization?.token??"");
      }
      sharedPref!.setString("token", authorization?.token ?? "token null");
      print(sharedPref);
      // showMasage(context, response.token??'', 'ok', () {Get.back(); });
      Get.off(() => MainPage_bottomNavigation());

    } catch (e) {
      // hideMassage(context);
      print(e);
      Get.snackbar('error', e.toString());
    }
  }
}
