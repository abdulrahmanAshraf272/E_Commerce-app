import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/forget_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ResetPasswordController extends GetxController {
  goToSuccessResetPassword();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  late TextEditingController password;
  late TextEditingController checkMatchPassword;
  String? email;

  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  goToSuccessResetPassword() async {
    if (password.text == checkMatchPassword.text) {
      statusRequest = StatusRequest.loading;
      update();
      print('email: $email, password: ${password.text}');
      var response = await resetPasswordData.postData(email!, password.text);
      statusRequest = handlingData(response);
      print(statusRequest);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          print('Response ===== ${response['status']}');
          update();
          Get.offNamed(AppRoute.successResetPassword);
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Something wrong happed");
          statusRequest = StatusRequest.failure;
          update();
        }
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Something wrong happed");
        statusRequest = StatusRequest.failure;
        update();
      }
    } else {
      Get.defaultDialog(
          title: "Warning",
          middleText: "the password doesn't match \n rewrite the password");
    }

    //Get.delete<ResetPasswordControllerImp>();
  }

  @override
  void onInit() {
    super.onInit();
    password = TextEditingController();
    checkMatchPassword = TextEditingController();
    email = Get.arguments['email'];
  }

  @override
  void dispose() {
    super.dispose();
    password.dispose();
    checkMatchPassword.dispose();
  }
}
