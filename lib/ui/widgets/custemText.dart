import 'package:flutter/material.dart';

class CustemText extends StatelessWidget {
String Txt;
Color color;
double size;
FontWeight fontWeight;

CustemText({required this.Txt,required this.color,required this.size, this.fontWeight=FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(Txt,
        style: TextStyle(
            color: color,
            fontSize: size,
            fontWeight: fontWeight));
  }
}
