import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hba/controller/auth/signup_controller.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/constant/routes.dart';
import 'package:hba/core/functions/alertcloseapp.dart';
import 'package:hba/core/functions/validinput.dart';
import 'package:hba/view/screen/auth/set_up_profile.dart';
import 'package:hba/view/widget/auth/customtextenteringauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../bloc/auth/auth_cubit.dart';
import '../../../bloc/profile/profile_cubit.dart';
import '../../../core/enum.dart';
import '../../../core/loaders/loading_overlay.dart';
import '../../../core/utils.dart';
import '../../../injection_container.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/signuptext.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  final _authCubit = sl<AuthCubit>();

  signUp() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      _authCubit.signUp(_emailController.text.trim(), _confirmPassword.text);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _password.dispose();
    _confirmPassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          centerTitle: true,
          title: Text(
            "17".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          elevation: 0.0,
        ),
        body: BlocListener<AuthCubit, AuthState>(
          bloc: _authCubit,
          listener: (context, state) {
            if (state is AuthLoading) {
              LoadingOverlay.of(context).show();
            } else if (state is AuthLoaded) {
              LoadingOverlay.of(context).hide();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => SetUpProfileScreen()),
                  (route) => false);
            } else if (state is AuthError) {
              LoadingOverlay.of(context).hide();
              Utils.showSnackBar(context, state.error);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 35),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 20),
                  CustomTextBodyAuth(text: "24".tr),
                  const SizedBox(height: 40),
                  CustomEnteringTextAuth(
                    labeltext: "18".tr,
                    hinttext: "12".tr,
                    icon: Icons.email_outlined,
                    mycontroller: _emailController,
                    valid: (val) {
                      return validInput(val!, 5, 100, "email");
                    },
                  ),
                  CustomEnteringTextAuth(
                    valid: (val) {
                      return validInput(val!, 5, 30, "password");
                    },
                    obscuretext: true,
                    labeltext: "19".tr,
                    hinttext: "13".tr,
                    icon: Icons.password_outlined,
                    mycontroller: _password,
                  ),
                  CustomEnteringTextAuth(
                    valid: (val) {
                      if (val!.isEmpty) {
                        return "51".tr;
                      }
                      if (_password.text != val) {
                        return "52".tr;
                      }
                    },
                    obscuretext: true,
                    labeltext: "44".tr,
                    hinttext: "13".tr,
                    icon: Icons.password_outlined,
                    mycontroller: _confirmPassword,
                  ),
                  CustomButtonAuth(
                    text: "17".tr,
                    onPressed: () {
                      signUp();
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
