import 'package:flutter/material.dart';
import 'package:arduino_iot_app/utils/constants.dart';

class H2 extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const H2({
    super.key,
    required this.text,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        color: Constants.darkest,
        fontSize: 25,
        fontWeight: FontWeight.w900,
      ),
    );
  }
}
