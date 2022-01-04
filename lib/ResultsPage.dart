import 'package:bmi_calculator/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'ReusableCard.dart';
import 'BottomBtn.dart';
import 'consts.dart';

class ResultsPage extends StatelessWidget {
  final String bmiCategory, bmiResult, bmiInterp;

  ResultsPage({@required this.bmiCategory, @required this.bmiResult, @required this.bmiInterp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Your Result", style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmiCategory, style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: Color(0xFF24D876)),),
                        Text(bmiResult, style: TextStyle(fontSize: 100.0, fontWeight: FontWeight.bold,),),
                        Text(bmiInterp, textAlign: TextAlign.center, style: TextStyle(fontSize: 22.0,),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomBtn(text: "RE-CALCULATE", onPress: () {
            Navigator.pop(context);
          },),
        ],
      ),
    );
  }
}