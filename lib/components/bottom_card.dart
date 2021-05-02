import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class BottomCard extends StatelessWidget {
  BottomCard({this.label, this.value, this.add, this.sub});

  final String label;
  final int value;
  final Function add;
  final Function sub;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          style: kLabelTextStyle,
        ),
        Text(
          value.toString(),
          style: kNumberTextStyle,
        ),
        SizedBox(
          height: 15.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RoundIconButton(
              onPress: sub,
              icon: FontAwesomeIcons.minus,
            ),
            RoundIconButton(
              onPress: add,
              icon: FontAwesomeIcons.plus,
            ),
          ],
        )
      ],
    );
  }
}

class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon, @required this.onPress});

  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(
        icon,
        color: kLabelColor,
        size: 30.0,
      ),
      shape: CircleBorder(),
      elevation: 6.0,
      fillColor: kButtonBackgroundColor,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}