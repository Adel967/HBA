import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hba/core/class/handlingdataview.dart';
import 'package:hba/core/constant/color.dart';
import 'package:hba/core/functions/alertcloseapp.dart';
import 'package:hba/core/functions/validinput.dart';
import 'package:hba/view/screen/auth/set_up_profile.dart';
import 'package:hba/view/screen/auth/signup.dart';
import 'package:hba/view/screen/home/home.dart';
import 'package:hba/view/widget/auth/customtextenteringauth.dart';
import 'package:hba/view/widget/auth/customtexttitleauth.dart';
import 'package:hba/view/widget/auth/logoauth.dart';
import 'package:hba/view/widget/auth/signuptext.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../bloc/auth/auth_cubit.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../core/loaders/loading_overlay.dart';
import '../../../core/utils.dart';
import '../../../injection_container.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isHiddenPassword = true;

  final _authCubit = sl<AuthCubit>();
  GlobalKey<FormState> formKey = GlobalKey();

  logIn() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      _authCubit.login(_emailController.text.trim(), _password.text);
    }
  }

  showPassword() {
    isHiddenPassword = !isHiddenPassword;
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(LoginCotrollerImp());
    return Scaffold(
        backgroundColor: AppColor.background,
        appBar: AppBar(
          backgroundColor: AppColor.background,
          centerTitle: true,
          title: Text(
            "9".tr,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          elevation: 0.0,
        ),
        body: WillPopScope(
          onWillPop: alertCloseApp,
          child: BlocListener<AuthCubit, AuthState>(
            bloc: _authCubit,
            listener: (context, state) {
              if (state is AuthLoading) {
                LoadingOverlay.of(context).show();
              } else if (state is AuthLoaded) {
                LoadingOverlay.of(context).hide();
                if (state.user!.displayName != null &&
                    state.user!.displayName!.isNotEmpty) {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => HomePage()),
                      (route) => false);
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => SetUpProfileScreen()),
                      (route) => false);
                }
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
                    const LogoAuth(),
                    const SizedBox(height: 10),
                    CustomTextTitleAuth(text: "10".tr),
                    const SizedBox(height: 10),
                    CustomTextBodyAuth(text: "11".tr),
                    const SizedBox(height: 30),
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
                      obscuretext: isHiddenPassword,
                      onTapIcon: () => {
                        showPassword(),
                      },
                      labeltext: "19".tr,
                      hinttext: "13".tr,
                      icon: isHiddenPassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      mycontroller: _password,
                      valid: (val) {
                        return validInput(val!, 5, 30, "password");
                      },
                    ),
                    InkWell(
                      onTap: () => Get.to(AppRoute.forgetPassword),
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ),
                    CustomButtonAuth(
                      text: "15".tr,
                      onPressed: () => logIn(),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SignUpText(
                      text1: "16".tr,
                      text2: "17".tr,
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) => SignUp()));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
