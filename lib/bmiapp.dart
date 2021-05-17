import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'reusable_col.dart';
import 'bottom_button.dart';
import 'constant.dart';
import 'result_page.dart';
import 'round_icon.dart';
import 'calculator_brain.dart';
enum Gender{
  Male,
  Female,
}
class BMIApp extends StatefulWidget {

  @override
  _BMIAppState createState() => _BMIAppState();
}

class _BMIAppState extends State<BMIApp> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: reUsableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.Male;
                      });
                    },
                    colour: selectedGender == Gender.Male ? KactiveColor : KinActiveColor,
                  cardChild: reUsableCol(
                    label: "Male",
                    icon: FontAwesomeIcons.mars,
                  ),
                  ),
                ),
                Expanded(
                  child: reUsableCard(
                      onPress: (){
                        setState(() {
                          selectedGender = Gender.Female;
                        });
                      },
                      colour: selectedGender == Gender.Female ? KactiveColor : KinActiveColor,
                  cardChild: reUsableCol(
                    label: "Female",
                    icon: FontAwesomeIcons.venus,
                  )),
                )
              ],
            ),
          ),
         Expanded(child: reUsableCard(
             cardChild: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget> [
                 Text("HEIGHT",style: KlabelTextStyle,),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: [
                     Text(height.toString(),style: KnumberStyle,
                     ),
                     Text("cm",style: KlabelTextStyle,
                     ),
                   ],
                 ),
                 SliderTheme(
                   data: SliderTheme.of(context).copyWith(
                     activeTrackColor: Colors.white,
                     inactiveTrackColor: Color(0xFF8D8E98),
                     thumbColor: Color(0xFFEB1555),
                     overlayColor: Color(0x29EB1555),
                     thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0,
                     ),
                   ),

                   child: Slider(value: height.toDouble(),
                     min: 120.0,
                     max: 220.0,
                     onChanged: (double newValue){
                     setState(() {
                       height = newValue.round();
                     });
                     },
                   ),
                 )
               ],
             ),
             colour: Color(0xFF1D1E33))),
          Expanded(
            child: Row(
            children: [
              Expanded(child: reUsableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WEIGHT",
                      style: KlabelTextStyle,),
                      Text(weight.toString(),
                      style: KnumberStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPress: (){
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPress: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )

                    ],
                  ),
                  colour: Color(0xFF1D1E33))),
              Expanded(
                  child: reUsableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("AGE",style: KlabelTextStyle,),
                          Text(age.toString(),style: KnumberStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPress: (){
                                setState(() {
                                  age--;
                                });
                              }),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(icon: FontAwesomeIcons.plus, onPress: (){
                                setState(() {
                                  age++;
                                });
                              }),
                            ],
                          )
                        ],
                      ),
                      colour: Color(0xFF1D1E33)))
            ],
          ),
          ),
          BottomButton(
            buttonText: "CALCULATE",
            onTap: (){
              CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  suggestion: calc.getSuggestion(),
                );
              }
              ),
              );
            },
          ),
        ],
      )
    );
  }
}


