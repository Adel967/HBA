import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hba/core/constant/imageasset.dart';
import 'package:hba/view/screen/auth/login.dart';
import 'package:hba/view/screen/auth/set_up_profile.dart';
import 'package:hba/view/screen/home/home.dart';
import 'package:hba/view/screen/onboarding.dart';
import 'package:hba/view/screen/router_page.dart';

import '../../core/shared_preferences/shared_preferences_instance.dart';
import '../../core/shared_preferences/shared_preferences_key.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  getData() {
    Future.delayed(Duration(seconds: 3), () {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        if (user!.displayName != null && user!.displayName!.isNotEmpty) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => SetUpProfileScreen()),
              (route) => false);
        }
      } else {
        if (SharedPreferencesInstance.pref
                .getBool(SharedPreferencesKeys.FIRST_TIME_KEY) ==
            null) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => OnBoarding()),
              (route) => false);
        } else {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => Login()), (route) => false);
        }
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = ColorTween(begin: Colors.blue.shade400, end: Colors.white)
        .animate(_animationController);
    _animationController.forward();
    _animationController.addListener(() {
      setState(() {});
    });
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _animation.value,
        body: Center(
          child: Image.asset(AppImageAsset.appLogo),
        ));
  }
}
