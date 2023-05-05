import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy/core/appColor.dart';

import '../Item/item.dart';
import '../widgets/custemText.dart';

class Item_Usally_UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () {
          Get.to(Item_Ui());
        },
        child: Container(
          width: w/2.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.6),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.inner),
              ],
              border: Border.all(color: Colors.black26)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset('assets/images/panadol.png',fit: BoxFit.fill, width: 60),
                Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustemText(
                            Txt: "drug name",
                            size: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          Icon(Icons.favorite_border)
                        ],
                      ),
                      CustemText(Txt: 'pharm code', color: Colors.grey, size: 18),
                      CustemText(
                          Txt: '2 Pieces Available', color: Colors.red, size: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustemText(
                              Txt: '22 EG',
                              color: AppColor.OnPrimaryColor,
                              size: 18),
                          CustemText(
                              Txt: '2/24',
                              color: AppColor.OnPrimaryColor,
                              size: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
