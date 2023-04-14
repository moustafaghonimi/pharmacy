import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy/core/appColor.dart';
import 'package:pharmacy/main.dart';
import 'package:pharmacy/ui/login/login_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../get_controler/bottom_navigation_controler.dart';
import 'add_Drug/addDrug_View.dart';

class MainPage_bottomNavigation extends StatelessWidget {
  static const String routeName = 'bottombar';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) =>
          Scaffold(
            bottomNavigationBar: salomonBottomBar(),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            floatingActionButton: FloatingActionButton(
              shape: StadiumBorder(
                  side: BorderSide(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .onPrimary,
                    width: 3,
                  )),
              onPressed: () {
                Get.to(AddDrug_view());
              },
              child: Icon(
                Icons.add,
              ),
            ),
            body: controller.currentScreen,
          ),
    );
  }

Widget salomonBottomBar() {
  return GetBuilder<HomeViewModel>(
    init: HomeViewModel(),
    builder: (controller) =>
        SalomonBottomBar(
          currentIndex: controller.tabIndex,
          onTap: (i) {
            controller.changeTabIndex(i);
          },
          items: [

            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.collections_bookmark_rounded),
              title: Text("My Order"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.message),
              title: Text("Messageing"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
  );
}

}
