import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/home/icon_box.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(
          child: Text(
            "Setting",
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        IconBox(
          bgColor: AppColor.background,
          child: SvgPicture.asset(
            "assets/icons/edit.svg",
            width: 18,
            height: 18,
          ),
        ),
      ],
    );
  }
}