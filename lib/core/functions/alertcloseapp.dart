import 'dart:io';

import 'package:hba/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertCloseApp() {
  Get.defaultDialog(
    title: "Alert",
    middleText: "Are You Sure?",
    actions: [
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red.shade300,
        ),
        onPressed: () {
          exit(0);
        },
        child: const Text("Confirm"),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.general,
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text("Cancel"),
      ),
    ],
  );
  return Future.value(true);
}
