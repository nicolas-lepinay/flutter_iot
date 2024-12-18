import 'package:flutter/material.dart';
import 'package:arduino_iot_app/utils/constants.dart';

class TextBody extends StatelessWidget {
  final String text;
  final TextAlign textAlign;

  const TextBody({
    super.key,
    required this.text,
    this.textAlign = TextAlign.justify,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        color: Constants.darkest,
        fontSize: 16,
      ),
    );
  }
}
