import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonAuth({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        padding: const EdgeInsets.symmetric(vertical: 14),
        onPressed: onPressed,
        color: AppColor.general,
        textColor: Colors.white,
        child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}
