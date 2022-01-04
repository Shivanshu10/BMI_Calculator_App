import 'package:flutter/material.dart';
import 'consts.dart';
import 'InputPage.dart';
import 'ResultsPage.dart';

void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InputPage(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: scfBackgroundColor,
        appBarTheme: AppBarTheme(
          color: scfBackgroundColor,
        )
      ),
    );
  }
}