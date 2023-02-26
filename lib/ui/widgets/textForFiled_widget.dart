import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
class TextFormFiled_widget extends StatelessWidget {
  String hint;
  String label;
  IconButton? icons;
  TextEditingController? controllers;
  Validator? validate;
  bool hideText;
  TextInputType keybordtype;
  VoidCallback? ontap;



  TextFormFiled_widget(this.hint, this.label,
      {this.icons ,
      this.validate,
      this.controllers,
      this.hideText = false,
      this.keybordtype = TextInputType.text,this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(

        textInputAction: TextInputAction.next,
        controller: controllers,
        validator: validate,
        obscureText: hideText,
        keyboardType: keybordtype,
        decoration: InputDecoration(
          suffixIcon: icons,
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.black),
          fillColor: Color.fromRGBO(242, 245, 248, 1.0),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
