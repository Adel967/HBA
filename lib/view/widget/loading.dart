import 'package:flutter/material.dart';
import 'package:hba/core/constant/imageasset.dart';
import 'package:hba/view/widget/added/dataviewstatue.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: DataViewStatue(
        assetLottie: AppImageAsset.loading,
        text: 'Loading...',
      ),
    );
  }
}
