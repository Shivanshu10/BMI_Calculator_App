import 'package:flutter/material.dart';

class BottomBtn extends StatelessWidget {
  final String text;
  final Function onPress;
  BottomBtn({@required this.text, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        child: Center(child: Text(text, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 80.0,
        color: Color(0xFFEB1555),
        padding: EdgeInsets.only(bottom: 20.0),
      ),
    );
  }
}