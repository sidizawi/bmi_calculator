import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {

  BottomButton({@required this.onPress, @required this.label});

  final Function onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kBottomContainerHeight,
        padding: EdgeInsets.only(bottom: 15.0),
        width: double.infinity,
        child: Center(
          child: Text(
            label,
            style: kLargeButtonTextStyle,
          ),
        ),
        ),
      );
  }
}