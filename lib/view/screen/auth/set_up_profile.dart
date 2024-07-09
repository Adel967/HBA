import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hba/view/screen/auth/login.dart';
import 'package:hba/view/screen/home/home.dart';

import '../../../bloc/profile/profile_cubit.dart';
import '../../../core/enum.dart';
import '../../../core/functions/validinput.dart';
import '../../../core/loaders/loading_overlay.dart';
import '../../../core/utils.dart';
import '../../../injection_container.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextenteringauth.dart';

class SetUpProfileScreen extends StatefulWidget {
  const SetUpProfileScreen({super.key});

  @override
  State<SetUpProfileScreen> createState() => _SetUpProfileScreenState();
}

class _SetUpProfileScreenState extends State<SetUpProfileScreen> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _dateOfBirth = TextEditingController();

  final _profileCubit = sl<ProfileCubit>();
  GlobalKey<FormState> formKey = GlobalKey();

  Gender gender = Gender.Male;

  signOut() async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => Login()), (route) => false);
  }

  setUpProfile() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      _profileCubit.setUpProfile(_userName.text.trim(),
          _phoneNumber.text.trim(), _dateOfBirth.text.trim(), gender);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () => signOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        bloc: _profileCubit,
        listener: (context, state) {
          if (state is ProfileUploading) {
            LoadingOverlay.of(context).show();
          } else if (state is ProfileUploaded) {
            LoadingOverlay.of(context).hide();
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => HomePage()),
                (route) => false);
          } else if (state is ProfileError) {
            LoadingOverlay.of(context).hide();
            Utils.showSnackBar(context, state.error);
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "45".tr,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "46".tr,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomEnteringTextAuth(
                            labeltext: "20".tr,
                            hinttext: "23".tr,
                            icon: Icons.person_outline,
                            mycontroller: _userName,
                            valid: (val) {
                              return validInput(val!, 5, 20, "username");
                            },
                          ),
                          CustomEnteringTextAuth(
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 10, 20, "phone");
                            },
                            labeltext: "21".tr,
                            hinttext: "22".tr,
                            icon: Icons.phone_android_outlined,
                            mycontroller: _phoneNumber,
                          ),
                          CustomEnteringTextAuth(
                            isNumber: true,
                            valid: (val) {
                              if (val!.isEmpty) {
                                return "51".tr;
                              }
                            },
                            labeltext: "49".tr,
                            hinttext: "50".tr,
                            readOnly: true,
                            onTapTextField: () => selectDate(),
                            icon: Icons.date_range,
                            mycontroller: _dateOfBirth,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              gender = Gender.Male;
                            });
                          },
                          child: Text("47".tr,
                              style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                              textStyle: TextStyle(color: Colors.white),
                              backgroundColor: gender == Gender.Male
                                  ? Colors.blue
                                  : Colors.blue.withOpacity(0.4)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                gender = Gender.Female;
                              });
                            },
                            child: Text(
                              "48".tr,
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: gender == Gender.Female
                                    ? Colors.pink
                                    : Colors.pink.withOpacity(0.4))),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButtonAuth(
                          text: "33".tr,
                          onPressed: () => setUpProfile(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1940),
        lastDate: DateTime.now(),
        initialDate: DateTime.now());

    if (picked != null) {
      _dateOfBirth.text = picked.toString().split(" ")[0];
    }
  }
}
