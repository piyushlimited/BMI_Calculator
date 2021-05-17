import 'package:bmi_calculator/constant.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultPage extends StatelessWidget {
  ResultPage({this.bmiResult,this.resultText,this.suggestion});

  final String bmiResult;
  final String resultText;
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text("Your Result",style: KtitleStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: reUsableCard(
            colour: KactiveColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,style: KresultTextStyle,
                  ),
                  Text(bmiResult,style: KbmiTextStyle,
                  ),
                  Text(suggestion
                    ,textAlign: TextAlign.center,
                    style: KbodyTextStyle,),

                ],
              ),
          ),
          ),
          BottomButton(buttonText: "RE-CALCULATE", onTap: (){
            Navigator.pop(context);
          })
        ],
      )
    );
  }
}
