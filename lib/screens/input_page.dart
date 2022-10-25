import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/BottomButton.dart';
import '../components/RoundIconButton.dart';
import '../components/icon_styling.dart';
import '../constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedCard;
  double height = 180;
  int weight = 75;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
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
                        selectedCard = Gender.male;
                      });
                    },
                    colour: selectedCard == Gender.male
                        ? kActiveColor
                        : kInactiveColor,
                    cardChild: IconStyling(
                        iconData: FontAwesomeIcons.mars, txt: "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedCard = Gender.female;
                        });
                      },
                      colour: selectedCard == Gender.female
                          ? kActiveColor
                          : kInactiveColor,
                      cardChild: IconStyling(
                          iconData: FontAwesomeIcons.venus, txt: "FEMALE")),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height", style: kLabelTextStyle),
                      Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(height.round().toString(),
                                style: kNumberTextStyle),
                            Text("cm", style: kLabelTextStyle),
                          ]),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25),
                          trackHeight: 2,
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          max: 250,
                          divisions: 250,
                          min: 100,
                          thumbColor: kBottomContainerColor,
                          activeColor: Colors.white,
                          inactiveColor: Color(0xFF8D8E98),
                          onChanged: (double value) {
                            setState(
                              () {
                                height = value;
                              },
                            );
                          },
                          onChangeEnd: (double value) {
                            height = value;
                          },
                        ),
                      ),
                    ],
                  ))),
          Expanded(
            child: Row(children: [
              Expanded(
                child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight", style: kLabelTextStyle),
                      Text(weight.toString(), style: kNumberTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (() {
                              setState(() {
                                weight--;
                              });
                            }),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveColor,
                  cardChild: Column(children: [
                    Text("Age", style: kLabelTextStyle),
                    Text(age.toString(), style: kNumberTextStyle),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              if (age > 20) {
                                age--;
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("Age limit is 20")));
                              }
                            });
                          }),
                      SizedBox(width: 10),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            age++;
                          });
                        },
                      )
                    ])
                  ]),
                ),
              ),
            ]),
          ),
          BottomButton(
            buttonName: "CALCULATE",
            onPressed: () {
              if (selectedCard == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please choose your gender!")));
              } else {
                CalculatorBrain calc =
                    CalculatorBrain(weight: weight, height: height);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmi: calc.calculatorBMI(),
                      resultStatus: calc.getResult(),
                      advice: calc.getAdvice(),
                    ),
                  ),
                );
              }
              ;
            },
          )
        ],
      ),
    );
  }
}
