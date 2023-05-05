import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CustemAnimetedText extends StatelessWidget {
  String Txt;
  Color color;
  double size;
  FontWeight fontWeight;
  int time;

  CustemAnimetedText({this.Txt='', this.color=Colors.black, this.size=12, this.fontWeight=FontWeight.normal,this.time=600});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        TypewriterAnimatedText(
          Txt,
          textStyle:  TextStyle(
            fontSize:size,
            color: color,
            fontWeight: fontWeight,
          ),
          speed: const Duration(milliseconds: 400),
        ),
      ],

      totalRepeatCount: 4,
      pause:  Duration(milliseconds: time),
      displayFullTextOnTap: true,
      stopPauseOnTap: true,
      isRepeatingAnimation: true,
    );
  }
}
