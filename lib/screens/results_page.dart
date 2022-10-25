import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/screens/input_page.dart';
import 'package:flutter/material.dart';

import '../components/BottomButton.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final String bmi;
  final String resultStatus;
  final String advice;

  const ResultPage(
      {Key key,
      @required this.bmi,
      @required this.resultStatus,
      @required this.advice})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text("BMI CALCULATOR"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Text(
                "YOUR RESULT",
                textAlign: TextAlign.center,
                style: kResultTextStyle,
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kInactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultStatus, style: kResultStatusStyle),
                    Text(bmi, style: kResultNumberStyle),
                    Text(advice,
                        textAlign: TextAlign.center, style: kAdviceStyle),
                  ],
                ),
              ),
            ),
            Expanded(
              child: BottomButton(
                  buttonName: "RECALCULATE",
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => InputPage()),
                    );
                  }),
            ),
          ],
        ),
      );
    }
  }
}
