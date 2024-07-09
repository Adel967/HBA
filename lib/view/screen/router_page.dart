import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hba/view/screen/auth/login.dart';
import 'package:hba/view/screen/home/home.dart';
import 'package:hba/view/screen/onboarding.dart';

import 'auth/set_up_profile.dart';

class RouterPage extends StatefulWidget {
  const RouterPage({super.key, required this.isFirstTime, required this.user});
  final bool isFirstTime;
  final User? user;

  @override
  State<RouterPage> createState() => _RouterPageState();
}

class _RouterPageState extends State<RouterPage> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("disposed100");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.userChanges(),
        initialData: widget.user,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            if (FirebaseAuth.instance.currentUser!.displayName == "" ||
                FirebaseAuth.instance.currentUser!.displayName == null) {
              return SetUpProfileScreen();
            }
            return HomePage();
          } else {
            if (widget.isFirstTime) {
              return OnBoarding();
            }
            return Login();
          }
        });
  }
}
