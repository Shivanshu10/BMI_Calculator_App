import 'package:bmi_calculator/ResultsPage.dart';
import 'package:bmi_calculator/RoundIconButton.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'RoundIconButton.dart';
import 'ResultsPage.dart';
import 'BottomBtn.dart';
import 'consts.dart';
import 'BMI.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor=inactiveCardColor;
  Color femaleCardColor=inactiveCardColor;
  int height=180;
  int weight=74;
  int age=20;
  
  void setActiveColor(Gender selectedGender) {
    if (selectedGender==Gender.male) {
      if (maleCardColor==inactiveCardColor) {
        maleCardColor=activeCardColor;
        femaleCardColor=inactiveCardColor;
      } else {
        maleCardColor=inactiveCardColor;
      }
    } else {
      if (femaleCardColor==inactiveCardColor) {
        femaleCardColor=activeCardColor;
        maleCardColor=inactiveCardColor;
      } else {
        femaleCardColor=inactiveCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(label: "MALE", icon: FontAwesomeIcons.mars,),
                    color: maleCardColor,
                    onPress: () {
                      setState(() {
                        setActiveColor(Gender.male);
                      }); 
                    }
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: IconContent(label: "FEMALE", icon: FontAwesomeIcons.venus,),
                    color: femaleCardColor,
                    onPress: () {
                      setState(() {
                        setActiveColor(Gender.female);
                      }); 
                    }
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("HEIGHT", style: labelStyle),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(height.toString(), style: numberLabelStyle),
                            Text("cm", style: labelStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            inactiveTrackColor: Color(0xFF8D8E98), 
                            activeTrackColor: Colors.pink,
                            overlayColor: Color(0x29EB1555),
                            thumbColor: Color(0xFFEB1555),
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          ),
                          child: Slider(
                            value: height.toDouble(), 
                            min: 120.0, 
                            max: 220.0,
                            //activeColor: Color(0xFFEB1555),
                            onChanged: (val) {
                              setState(() {
                                height=val.round();
                              }); 
                            },
                          ), 
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: labelStyle),
                        Text(weight.toString(), style: numberLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPress: () {
                              setState(() {
                                weight--;
                              }); 
                            }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPress: () {
                              setState(() {
                                weight++;
                              }); 
                            }),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: inactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: labelStyle),
                        Text(age.toString(), style: numberLabelStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(icon: FontAwesomeIcons.minus, onPress: () {
                              setState(() {
                                age--;
                              }); 
                            }),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.plus, onPress: () {
                              setState(() {
                                age++;
                              }); 
                            }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBtn(text: "CALCULATE", onPress: () {
            BMI bmi=BMI(height: height, weight: weight);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultsPage(
              bmiResult: bmi.getBmi(),
              bmiInterp: bmi.getInter(),
              bmiCategory: bmi.getCategory(),
            )));
          }),
        ],
      ),
    );
  }
}
