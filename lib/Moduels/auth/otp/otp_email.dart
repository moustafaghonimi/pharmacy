import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy/Moduels/auth/otp/reset_Password.dart';

import '../../../core/appColor.dart';
import '../../../get_controler/authViewModel_Controller .dart';
import '../../../repositorie/data_source/remote.dart';
import '../../../shared/network/remote/api_manger.dart';
import '../../widgets/custemButton.dart';
import '../../widgets/custemText.dart';
import '../../widgets/custemTextFormFiled.dart';


class Otp_BY_Email extends StatelessWidget {
  static const routeName = 'otp';
  Repo repo=Repo(baseRepositorie: Remote());
  var formKey = GlobalKey<FormState>();
  var emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(AuthViewModel());

    final AuthViewModel controller = Get.find();

    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColor.BlackColor),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: CustemText(Txt: 'OTP', color: AppColor.BlackColor, size: 20),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/otpImage.jpg',
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
                  Txt: "We Will send you a ane time code on your account!",
                  color: AppColor.OnPrimaryColor,
                  size: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Form(
              key: formKey,
              child: CustemTextFormFiled(
                'Mostafa*****@gmail.com',
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
            ),
            SizedBox(
              height: h * 0.01,
            ),
            Container(
              width: w * 0.5,
              child: CustemButton(
                callBack: () {
                  controller.email = emailControler.text;
                  return ForgetPasswordOTP_validation();
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

  void ForgetPasswordOTP_validation() async {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    Get.snackbar('Loading', "Call server To Get Otp code",
        backgroundColor: AppColor.PrimaryColor,
        progressIndicatorBackgroundColor: AppColor.OnPrimaryColor);
    try {
      var response = await repo.baseRepositorie?.forgetPasswordOTP(
        emailControler.text,
      );

      if (response?.status != null) {
        Get.snackbar('status', response!.status.toString());
        Get.to(ResetPassword());
      }
      if (response?.message == null ||
          response?.message != 'OTP code have been sent to your account') {
        Get.snackbar('Email  Is Incorrect', response!.message.toString());

        return;
      }

    } catch (e) {
      // hideMassage(context);
      print(e);
      Get.snackbar('error', e.toString());
    }
  }
}
