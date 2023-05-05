import 'package:flutter/material.dart';

typedef Validator = String? Function(String?);
typedef OnSaved = String? Function(String?);
class CustemTextFormFiled extends StatelessWidget {
  String hint;
  String label;
  IconButton? icons;
  TextEditingController? controllers;
  Validator? validate;
  OnSaved? onSaved;
  bool hideText;
  TextInputType keybordtype;
  VoidCallback? ontap;



  CustemTextFormFiled(this.hint, this.label,
      {this.icons ,
      this.validate,
      this.onSaved,
      this.controllers,
      this.hideText = false,
      this.keybordtype = TextInputType.text,this.ontap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextFormField(
onSaved: onSaved,
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
