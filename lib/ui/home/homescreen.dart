import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/appColor.dart';
import '../../main.dart';
import '../drawerr_widget.dart';
import '../login/login_screen.dart';
import '../widgets/custemAnimetedTxt.dart';
import 'home_item.dart';

class HomeScreen_view extends StatelessWidget {
  static const String routeName = 'homeView';

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    return Stack(
      
      children: [
        Image.asset('assets/images/home.png',fit: BoxFit.cover,width: double.infinity,),

        Scaffold(
          drawer: Drawerr_screen(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            // title: Text('Home'),
            actions: [
              IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                  },
                  icon: Icon(Icons.shopping_cart_rounded)),
              IconButton(
                  onPressed: () {
                    },
                  icon: Icon(Icons.notifications_active_rounded)),
              IconButton(
                  onPressed: () {
                    if (sharedPref == null) {
                      Get.offAll(LoginScreen_UI());
                      return;
                    }
                    sharedPref!.clear();
                    Get.offAll(LoginScreen_UI());
                  },
                  icon: Icon(Icons.logout)),
            ],
          ),
          body: Column(
            children: [

              Center(child: CustemAnimetedText(color: AppColor.WhaitColor,Txt:'Welcome In\nDruger App',size: 30,fontWeight: FontWeight.bold,)),
              SizedBox(
                height: h*0.02,
              ),
              Expanded(
                child: ListView.builder(itemBuilder: (context, index) {
                  return HomeItem();
                },itemCount: 10),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: HomeItem(),
              // ),
            ],
          ),


        ),
      ],
    );
  }
}
