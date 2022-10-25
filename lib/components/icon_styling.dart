import 'package:flutter/cupertino.dart';

import '../constants.dart';

class IconStyling extends StatelessWidget {
  IconStyling({@required this.iconData, @required this.txt});

  final IconData iconData;
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(iconData, size: 80.0),
        SizedBox(height: 15.0),
        Text(
          txt,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
