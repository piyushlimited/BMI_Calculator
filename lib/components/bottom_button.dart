import 'package:flutter/material.dart';
import 'package:bmi_calculator/constant.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText,@required this.onTap});
  final Function onTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(child: Text(buttonText,style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        ),
        ),
        width: double.infinity,
        height: KbottomButtonHeight,
        margin: EdgeInsets.only(top: 10.0),
        decoration: BoxDecoration(
          color: Color(KbottomButtonColor),
        ),
      ),
    );
  }
}