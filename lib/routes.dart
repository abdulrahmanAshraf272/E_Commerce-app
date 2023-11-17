import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/view/screen/auth/check_email.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/forget_password.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/success_reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/login.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/reset_password.dart';
import 'package:ecommerce_app/view/screen/auth/signup.dart';
import 'package:ecommerce_app/view/screen/auth/forget_password/verify_code.dart';
import 'package:ecommerce_app/view/screen/auth/success_signup.dart';
import 'package:ecommerce_app/view/screen/auth/verifycode_signup.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  //OnBoarding
  AppRoute.onBoarding: (context) => const OnBoarding(),
  //Auth
  AppRoute.login: (context) => const Login(),
  AppRoute.signUp: (context) => const SignUp(),
  AppRoute.forgetPassword: (context) => const ForgetPassword(),
  AppRoute.verifyCode: (context) => const VerifyCode(),
  AppRoute.resetPassword: (context) => const ResetPassword(),
  AppRoute.checkEmail: (context) => const CheckEmail(),
  AppRoute.successResetPassword: (context) => const SuccessResetPassword(),
  AppRoute.successSignUp: (context) => const SuccessSignUp(),
  AppRoute.verifyCodeSignUp: (constext) => const VerifyCodeSignUp()
};
