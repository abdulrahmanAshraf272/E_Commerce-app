import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  setNewPassword();
  goToVerfiyCodeScreen();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController checkMatchPassword;

  @override
  setNewPassword() {}
  @override
  goToVerfiyCodeScreen() {
    Get.offNamed(AppRoute.verifyCode);
  }

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    checkMatchPassword = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    checkMatchPassword.dispose();
  }
}
