import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPasswordScreen();
}

class VerifyCodeControllerImp extends VerifyCodeController {
  late String verifyCode;

  @override
  checkCode() {}
  @override
  goToResetPasswordScreen() {
    Get.offNamed(AppRoute.resetPassword);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
