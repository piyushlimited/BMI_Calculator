import 'package:flutter/material.dart';
import 'constant.dart';


class reUsableCol extends StatelessWidget {
  reUsableCol({@required this.label, @required this.icon});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
          size: 80.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(label, style: KlabelTextStyle,
        ),
      ],
    );
  }
}