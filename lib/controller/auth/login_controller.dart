import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpScreen();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool visiblePassword = false;
  showPassword() {
    visiblePassword = !visiblePassword;
    update();
  }

  @override
  login() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      //print('Valid');
    } else {
      //print('Not Valid');
    }
  }

  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  goToSignUpScreen() {
    Get.offNamed(AppRoute.signUp);
    //Get.delete<LoginControllerImp>();
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
