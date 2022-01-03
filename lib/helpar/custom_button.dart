import 'package:batch_d_login_singup_fiarbase/utill/all_color.dart';
import 'package:flutter/material.dart';

class CoustomButton extends StatefulWidget {
  double buttonHight;
  double buttonWidth;
  Color btnTextColor;
  String buttonText;
  CoustomButton({Key? key,
    required this.buttonHight,
    required this.buttonWidth,
    required this.btnTextColor,
    required this.buttonText,
  }) : super(key: key);

  @override
  _CoustomButtonState createState() => _CoustomButtonState();
}

class _CoustomButtonState extends State<CoustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: Container(
        height: widget.buttonHight,
        width: widget.buttonWidth,
        color: AllColors.appColor,
        child: Center(
          child: Text(widget.buttonText,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: widget.btnTextColor
            ),
          ),
        ),
      ),
    );
  }
}
