import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/controller/settings_controller.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/view/about_us_screen.dart';
import 'package:hba/view/screen/app_language_screen.dart';
import 'package:hba/view/screen/home/reservations.dart';
import 'package:hba/view/widget/home/setting_item.dart';
import 'package:hba/view/widget/settings/profile.dart';

import '../../../core/localization/changelocal.dart';
import '../../screen/auth/login.dart';
import 'package:hba/injection_container.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({super.key});

  signOut(BuildContext context) async {
    await Future.wait(
        [FirebaseAuth.instance.signOut(), sl.reset(dispose: false)]);
    initInjection();
    Get.put(sl<LocaleController>());

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());
    return SingleChildScrollView(
      padding: const EdgeInsets.only(right: 20, top: 10),
      child: Column(
        children: [
          const Profile(),
          const SizedBox(height: 40),
          SettingItem(
            title: "appLanguage".tr,
            leadingIcon: Icons.settings,
            leadingIconColor: AppColor.orange,
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AppLanguageScreen())),
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "reservations".tr,
            leadingIcon: Icons.bookmark_border,
            leadingIconColor: AppColor.blue,
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => ReservationsScreen())),
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "aboutUs".tr,
            leadingIcon: Icons.privacy_tip_outlined,
            leadingIconColor: AppColor.green,
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => AboutUsScreen())),
          ),
          const SizedBox(height: 10),
          SettingItem(
            title: "logOut".tr,
            leadingIcon: Icons.logout_outlined,
            leadingIconColor: AppColor.red,
            onTap: () {
              showCupertinoModalPopup(
                context: context,
                builder: (context) => CupertinoActionSheet(
                  message: Text("logOutMessage".tr),
                  actions: [
                    CupertinoActionSheetAction(
                      onPressed: () => signOut(context),
                      child: Text(
                        "logOut".tr,
                        style: const TextStyle(color: AppColor.actionColor),
                      ),
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: const Text("Cancel"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
