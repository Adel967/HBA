import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import 'package:lottie/lottie.dart';

class DataViewStatue extends StatelessWidget {
  final String text;
  final String assetLottie;
  const DataViewStatue({super.key, required this.text, required this.assetLottie});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Lottie.asset(assetLottie, width: 250, height: 250)),
        Text(text,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColor.general))
      ],
    );
  }
}
