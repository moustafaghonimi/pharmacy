import 'package:flutter/material.dart';
import 'package:pharmacy/core/appColor.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  VoidCallback callBack;
  Color textColor;
  Color buttonColor;
  double buttonRedias;

  ButtonWidget(this.callBack, this.text,
      {this.textColor = Colors.black,
      this.buttonColor = Colors.black,
      this.buttonRedias = 5});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callBack,
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRedias),
          )),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
