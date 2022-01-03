import 'dart:html';

import 'package:batch_d_login_singup_fiarbase/utill/all_color.dart';
import 'package:flutter/material.dart';

class CoustomTextFormField extends StatefulWidget {
  bool obscureValue;
  TextEditingController emailController;
  String labelText;
  String hintText;
  CoustomTextFormField({Key? key,
    required this.obscureValue,
    required this.emailController,
    required this.labelText,
    required this.hintText
  }) : super(key: key);

  @override
  _CoustomTextFormFieldState createState() => _CoustomTextFormFieldState();
}

String pass='';

class _CoustomTextFormFieldState extends State<CoustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: TextFormField(
        validator: (value){
          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value!);
          if(value == null || value!.isEmpty){
            return 'This field can not be empty';
          }
          if(widget.labelText=="Email"){
            if(!emailValid){
              return "Invalid Email Format";
            }
          }
          if(widget.labelText=='Password'){
            pass=value;
            if(value.length<6 || value.length>10)
              return 'Password shoule be 6 to 10 Character';
          }
          if(widget.labelText=='Conform Password'){
            if(pass!=value)
              return "'Password Didn't match";
          }
        },
        controller: widget.emailController,
        obscureText: widget.obscureValue,
        cursorColor: AllColors.appColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: AllColors.appColor
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: AllColors.appColor
              )
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: AllColors.appColor
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: AllColors.appColor
          ),
        ),
      ),
    );
  }
}
