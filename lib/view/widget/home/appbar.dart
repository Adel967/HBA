import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/home/notification_box.dart';

class Homebar extends StatelessWidget {
  final IconData icon;
  final String text;

  const Homebar({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppColor.labelColor,
          size: 25,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          style: TextStyle(
            color: AppColor.darker,
            fontSize: 15,
          ),
        ),
        Spacer(),
        // NotificationBox(
        //   notifiedNumber: 1,
        // )
      ],
    );
  }
}
