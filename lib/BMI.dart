import 'dart:math';

class BMI {
  final int height, weight, age;
  double bmi=0;
  BMI({this.height, this.weight, this.age});

  String getBmi() {
    bmi=weight/pow(height/100, 2);
    return bmi.toStringAsFixed(1);
  }

  String getCategory() {
    if (bmi>=25) {
      return "OVERWEIGHT";
    } else if (bmi>18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getInter() {
    if (bmi>=25) {
      return "You should exercise more and try eating less calories";
    } else if (bmi>18.5) {
      return "You are fit, try maintaing it";
    } else {
      return "You are underweight try eating more";
    }
  }
}