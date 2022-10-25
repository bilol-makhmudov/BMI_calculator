import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onPressed;
  final String buttonName;

  const BottomButton(
      {Key key, @required this.onPressed, @required this.buttonName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          child: Center(child: Text(buttonName, style: kBottomContainerStyle)),
          color: kBottomContainerColor,
          margin: EdgeInsets.only(top: 10),
          height: 80.0,
          width: double.infinity),
    );
  }
}
