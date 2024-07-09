import 'package:flutter/material.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String text;
  const CustomTextTitleAuth({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.displayMedium,
      textAlign: TextAlign.center,
    );
  }
}
