import 'package:hba/core/constant/routes.dart';
import 'package:hba/core/middleware/middleware.dart';
import 'package:hba/view/screen/auth/forget_password/forgetpassword.dart';
import 'package:hba/view/screen/auth/login.dart';
import 'package:hba/view/screen/auth/set_up_profile.dart';
import 'package:hba/view/screen/auth/signup.dart';
import 'package:hba/view/screen/auth/succes_signup.dart';
import 'package:hba/view/screen/auth/forget_password/successpassreset.dart';
import 'package:hba/view/screen/auth/verifycodesignup.dart';
import 'package:hba/view/screen/home/home.dart';
import 'package:hba/view/screen/language.dart';
import 'package:hba/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:hba/view/screen/splash_screen.dart';
import 'view/screen/auth/forget_password/resetpassword.dart';
import 'view/screen/auth/forget_password/verifycode.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const SplashScreen(), middlewares: [MiddleWare()]),
  // GetPage(name: "/", page: () => const TestView()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verifyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.setUpProfile, page: () => const SetUpProfileScreen()),
  GetPage(
      name: AppRoute.successPasswordReset,
      page: () => const SuccessPasswordReset()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),

  //home
  GetPage(name: AppRoute.homePage, page: () => const HomePage()),
];
