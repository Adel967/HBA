import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hba/bindings/initialbiniding.dart';
import 'package:hba/core/localization/changelocal.dart';
import 'package:hba/core/localization/translations.dart';
import 'package:hba/core/services/services.dart';
import 'package:hba/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hba/view/screen/auth/login.dart';
import 'package:hba/view/screen/auth/set_up_profile.dart';
import 'package:hba/view/screen/home/home.dart';
import 'package:hba/view/screen/onboarding.dart';
import 'package:hba/view/screen/splash_screen.dart';

import 'core/shared_preferences/shared_preferences_instance.dart';
import 'core/shared_preferences/shared_preferences_key.dart';
import 'firebase_options.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initInjection();
  await SharedPreferencesInstance().init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(sl<LocaleController>());
    return GetMaterialApp(
      translations: MyTranslations(),
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      theme: controller.appTheme,
      getPages: routes,
      initialBinding: InitialBinding(),
      home: SplashScreen(),
    );
  }
}
