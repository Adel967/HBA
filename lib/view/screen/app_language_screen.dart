import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/localization/changelocal.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';

class AppLanguageScreen extends GetView<LocaleController> {
  const AppLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("appLanguage".tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
          ),
          itemCount: LocaleController.all.length,
          itemBuilder: (context, index) {
            Locale locale = LocaleController.all[index];
            return GestureDetector(
              onTap: () {
                controller.changeLang(locale.languageCode);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: controller.language == locale
                      ? AppColor.general
                      : AppColor.general.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CountryFlag.fromCountryCode(
                      LocaleController.getFlag(locale.toString()),
                      height: 62,
                      width: 76,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      LocaleController.getLanguageName(locale.toString()),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
