import 'package:hba/controller/forget_password/successpasswordreset_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPasswordReset extends StatelessWidget {
  const SuccessPasswordReset({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPasswordcontrollerResetImp controller =
        Get.put(SuccessPasswordcontrollerResetImp());
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        backgroundColor: AppColor.background,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const Spacer(),
          Center(
              child: Icon(
            Icons.check_circle_outline,
            color: AppColor.general,
            size: 180,
          )),
          Text(
            "36".tr,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            child: CustomButtonAuth(
              text: "31".tr,
              onPressed: () {
                controller.gotoLogin();
              },
            ),
          ),
        ],
      ),
    );
  }
}
