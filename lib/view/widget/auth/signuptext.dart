import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';

class SignUpText extends StatelessWidget {
  final String text1;
  final String text2;
  final void Function() onTap;
  const SignUpText({super.key, required this.text1, required this.text2, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(text1 ,style: Theme.of(context).textTheme.bodyMedium  ),
                InkWell(
                  onTap: onTap,
                  child: Text(
                    text2,
                    style: TextStyle(color: AppColor.general,fontSize: 12 ,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
  }
}