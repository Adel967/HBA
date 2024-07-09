import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/data/datasource/static/data.dart';
import 'package:hba/view/widget/home/custom_image.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: <Widget>[
          CustomImage(
            profile["image"]!,
            width: 80,
            height: 80,
            radius: 50,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.displayName!,
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            FirebaseAuth.instance.currentUser!.email!,
            style: TextStyle(
              color: AppColor.labelColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
