import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy/core/appColor.dart';

import '../../repositorie/data_source/remote.dart';
import '../../shared/network/remote/api_manger.dart';
import '../../get_controler/authViewModel_Controller .dart';
import '../../shared/componant/ui_utlis.dart';
import '../login/login_screen.dart';
import '../widgets/custemButton.dart';
import '../widgets/custemText.dart';
import '../widgets/custemTextFormFiled.dart';

class ResetPassword extends StatefulWidget {
  static const routeName = 'reset';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var formKey = GlobalKey<FormState>();
  Repo repo=Repo(baseRepositorie: Remote());
  var passwordControler = TextEditingController();

  var otpCodeControler = TextEditingController();

  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.BlackColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: CustemText(
            Txt: 'Reset Password', color: AppColor.BlackColor, size: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/reset_pass.jpg',
              width: w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: h * 0.01,
            ),
            CustemText(
                Txt: "OTP Verification  ",
                color: AppColor.PrimaryColor,
                size: 25,
                fontWeight: FontWeight.bold),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustemText(
                  Txt:
                      "We Will Received you a ane time code on your account! \n Use this code ",
                  color: AppColor.OnPrimaryColor,
                  size: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustemTextFormFiled(
                      'OTP Code ',
                      'OTp',
                      icons: IconButton(
                        icon: Icon(Icons.numbers),
                        onPressed: () {},
                      ),
                      controllers: otpCodeControler,
                      validate: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'OTP Code Required';
                        }
                      },
                    ),
                    CustemTextFormFiled(
                      'Enter New Password',
                      'New Password',
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
                  ],
                )),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              width: w * 0.5,
              child: CustemButton(
                callBack: () {
                  return ResetPasswordOTP_validation();
                },
                text: 'Send',
                buttonColor: AppColor.PrimaryColor,
                buttonRedias: 10,
                textColor: AppColor.WhaitColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final AuthViewModel controller = Get.find();

  void ResetPasswordOTP_validation() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    try {
      var response = await repo.baseRepositorie?.resetPassword(
          otpCodeControler.text, passwordControler.text, controller.email!);
      // hideMassage(context);
      if (response?.status != null) {
        Get.snackbar('status', response!.status.toString());
        Get.snackbar('message', response.message.toString());
        Get.to(LoginScreen_UI());
      }
      if (response?.message == null ||
          response?.message != 'Password has been changed successfully') {
        Get.snackbar('message', response!.message.toString());

        return;
      }
    } catch (e) {
      print(e);
      Get.snackbar('error', e.toString());
    }
  }
}
