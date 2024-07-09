import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
      child: CircleAvatar(
        radius: 80,
        backgroundColor: AppColor.general,
        backgroundImage: const AssetImage(
          AppImageAsset.logo,
        ),
      ),
    );
    // Image.asset(AppImageAsset.logo, height: 180,);
    // BoxDecoration(
    //   borderRadius: BorderRadius.circular(100),
    // )
  }
}
