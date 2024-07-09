import 'package:flutter/material.dart';
import 'package:hba/core/constant/imageasset.dart';
import 'package:lottie/lottie.dart';

class WaitingWidget extends StatefulWidget {
  const WaitingWidget({Key? key}) : super(key: key);

  @override
  State<WaitingWidget> createState() => _WaitingWidgetState();
}

class _WaitingWidgetState extends State<WaitingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
      child: Lottie.asset(AppImageAsset.loading,
          width: 100, height: 100, fit: BoxFit.cover));
}
