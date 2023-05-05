import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../core/appColor.dart';
import '../home/homescreen.dart';
import '../widgets/custemAnimetedTxt.dart';
import '../widgets/custemButton.dart';
import '../widgets/custemText.dart';

class Item_Ui extends StatelessWidget {
  static const String routName = 'item';

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(236, 238, 241, 1.0),
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.off(HomeScreen_view());
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              )),
        ],
        elevation: 0.0,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 100,
        centerTitle: true,
        title: CustemAnimetedText(
            Txt: 'Druge Name', color: Colors.black, size: 20, time: 200),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              tooltip: 'Ask Question',
              label: 'Ask About for Product',
              icon: CustemButton(
                  callBack: () {},
                  text: 'Ask Question',
                  buttonColor: AppColor.OnPrimaryColor,
                  buttonRedias: 20,
                  textColor: AppColor.WhaitColor),
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              label: 'Use this to Buy the product',
              tooltip: 'Add To Cart',
              icon: CustemButton(
                  callBack: () {},
                  text: 'Add To Cart',
                  buttonColor: AppColor.PrimaryColor,
                  buttonRedias: 20,
                  textColor: AppColor.WhaitColor),
              backgroundColor: Colors.white),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/panadol.png',
                    fit: BoxFit.fill,
                    width: w * 1,
                    height: h / 4,
                  ),
                  SizedBox(
                    height: h * .01,
                  ),
                  Container(
                    width: w * 0.9,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustemText(
                          Txt: "drug name",
                          size: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Row(
                          children: [
                            CustemText(
                                Txt: 'EXP Date : ',
                                color: AppColor.BlackColor,
                                size: 22),
                            CustemText(
                                Txt: '2/24',
                                color: AppColor.OnPrimaryColor,
                                size: 22),
                          ],
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Row(
                          children: [
                            CustemText(
                                Txt: 'Price : ',
                                color: AppColor.BlackColor,
                                size: 22),
                            CustemText(
                                Txt: '24 Eg',
                                color: AppColor.OnPrimaryColor,
                                size: 22),
                          ],
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        CustemText(
                            Txt: 'Pharmacy : pharm code',
                            color: Colors.grey,
                            size: 18),
                        SizedBox(
                          height: h * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CustemText(
                                Txt: 'Select Quantity   ',
                                color: Colors.black54,
                                size: 18),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.exposure_minus_1_sharp,
                                  color: Colors.white,
                                )),
                            CustemText(
                                Txt: ' 1 ',
                                color: AppColor.BlackColor,
                                size: 20),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.grey,
                                ),
                                child: Icon(
                                  Icons.plus_one_sharp,
                                  color: Colors.white,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustemText(
                                Txt: 'Check Delivery ',
                                color: AppColor.BlackColor,
                                size: 20),
                            CustemButton(
                              callBack: () {},
                              text: 'Check',
                              fontsize: 16,
                              textColor: AppColor.OnPrimaryColor,
                              buttonRedias: 12,
                              buttonColor: Color.fromRGBO(236, 238, 241, 1.0),
                            )
                          ],
                        ),
                        SizedBox(
                          height: h * .01,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: w,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustemText(
                          Txt: 'Usually Bought Together',
                          color: AppColor.BlackColor,
                          size: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: CustemText(
                              Txt: "View All",
                              color: Colors.black54,
                              size: 14,
                            ))
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
