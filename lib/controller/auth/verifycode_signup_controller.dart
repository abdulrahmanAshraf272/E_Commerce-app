import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/verifycode_signup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifycodeSignup verifycodeSignup = VerifycodeSignup(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  late String verifycode;
  String? email;

  @override
  checkCode() {}
  @override
  goToSuccessSignUp() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifycodeSignup.postData(email!, verifycode);
    statusRequest = handlingData(response);
    update();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.offNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify code is not correct");
      }
    }
  }

  resendVerifycode() {
    verifycodeSignup.resendVerifycode(email!);
    Get.snackbar('Resend Done!', 'go check your email.');
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments['email'];
  }

  @override
  void dispose() {
    super.dispose();
  }
}
