import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/bottom_card.dart';
import 'results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Genders{
  male,
  female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Genders selectedGender;
  double height = 175.0;
  int weight = 75;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.male;
                      });
                    },
                    color: selectedGender == Genders.male ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Genders.female;
                      });
                    },
                    color: selectedGender == Genders.female ? kActiveCardColor : kInactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT", 
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toInt().toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: kBottomContainerColor,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      min: 110.0,
                      max: 220.0,
                      value: height,
                      onChanged: (newValue) {
                        setState(() {
                          height = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: BottomCard(
                      label: 'WEIGHT',
                      value: weight,
                      add: () {
                        setState(() {
                          weight++;
                        });
                      },
                      sub: () {
                        setState(() {
                          weight--;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: BottomCard(
                      label: 'AGE',
                      value: age,
                      add: () {
                        setState(() {
                          age++;
                        });
                      },
                      sub: () {
                        setState(() {
                          age--;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'CALCULATE YOUR BMI',
            onPress: () {

              CalculatorBrain calc = CalculatorBrain(
                height: height,
                weight: weight,
              );

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => 
                  ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                )
              );
            },
          ),
        ],
      ),
    );
  }
}

