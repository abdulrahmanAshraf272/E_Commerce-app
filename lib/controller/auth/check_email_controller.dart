import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/forget_password/check_email_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CheckEmailController extends GetxController {
  Future<bool> checkEmail();
  goToVerfiyCodeScreen();
}

class CheckEmailControllerImp extends CheckEmailController {
  late TextEditingController email;
  CheckEmailData checkEmailData = CheckEmailData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  @override
  Future<bool> checkEmail() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await checkEmailData.postData(email.text);
    statusRequest = handlingData(response);

    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Response ===== ${response['status']}');
        update();
        return true;
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "the email is not correct!");
        statusRequest = StatusRequest.failure;
        update();
        return false;
      }
    } else {
      Get.defaultDialog(title: "Warning", middleText: "Something wrong happed");
      statusRequest = StatusRequest.failure;
      update();
      return false;
    }
  }

  @override
  goToVerfiyCodeScreen() async {
    if (await checkEmail()) {
      Get.offNamed(AppRoute.verifyCode, arguments: {"email": email.text});
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
  }
}
