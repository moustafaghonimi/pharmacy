import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/api/api_manger.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/shared/componant/ui_utlis.dart';
import 'package:pharmacy/ui/register/register_screen_ui.dart';

import '../../core/appColor.dart';
import '../home/homeScreen_Ui.dart';
import '../widgets/button_widget.dart';
import '../widgets/textForFiled_widget.dart';

class LoginScreen_UI extends StatefulWidget {
  static const String routeName = 'LoginScreen';

  @override
  State<LoginScreen_UI> createState() => _LoginScreen_UIState();

}

class _LoginScreen_UIState extends State<LoginScreen_UI> {
  var formKey = GlobalKey<FormState>();
  var emailControler = TextEditingController();
  var passwordControler = TextEditingController();
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
          Column(
            children: [
              Text(
                'BEST ONLINE',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              Text('MEDICINE',
                  style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),
              Text('EXP APP',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: h * .04,
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
                    child: SingleChildScrollView (
                      child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFormFiled_widget(
                                'Enter your Email', 'Email',
                                icons: IconButton(icon: Icon(Icons.email),onPressed: () {},),
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
                              TextFormFiled_widget(
                                  'Enter your Password', 'Password',
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
                                  hideText:passwordVisible? true:false,
                                validate: (value) {
                                  if(value==null || value.trim().isEmpty){
                                    return 'Password not validate';
                                  }
                                },

                              ),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      left: 180.0, bottom: 10),
                                  child: InkWell(
                                    hoverColor: AppColor.PrimaryColor,
                                    onTap: () {},
                                    child: Text('Forgot Password?',
                                        style: TextStyle(color: Colors.black)),
                                  )),
                              Container(
                                width: w * 0.9,
                                child: ButtonWidget(
                                  () {
                                    print(passwordControler);
                                    print(passwordControler);
                                    return login_validation();
                                  },
                                  'LOGIN',
                                  buttonColor: AppColor.PrimaryColor,
                                  buttonRedias: 10,
                                  textColor: AppColor.BlackColor,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an account?",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54)),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(RegisterScreen());
                                      },
                                      child: Text("Sign up",
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
            ),
          )
        ],
      ),
    );
  }

  void login_validation() async{
    if (formKey.currentState?.validate() == false) {
      return;
    }
    showloding('Loading...', context);
    try{
      var response=await API_Manger.login(emailControler.text, passwordControler.text);
hideMassage(context);
if(response.token==null){
  showMasage(context, response.msg??"Email OR Password not correct !", 'OK', () {Get.back();});
  return;
}
sharedPref!.setString("token", response.token??"token null");
      print(sharedPref);
      // showMasage(context, response.token??'', 'ok', () {Get.back(); });
      Get.off(()=>HomeScreen_UI());


    }
    catch(e){
      hideMassage(context);
      print(e);

      showMasage(context, 'Check Internet and Try Again ------> ${e}', 'OK', () { Get.back();});

    }
  }
}
