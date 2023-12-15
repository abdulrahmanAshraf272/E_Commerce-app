import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:get/get.dart';

abstract class SignUpController extends GetxController {
  signup();
  goToSignInScreen();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  SignupData signupData = SignupData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController phone;
  late TextEditingController username;
  @override
  signup() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, password.text, email.text, phone.text.toString());
      statusRequest = handlingData(response);

      print(statusRequest);

      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          print('Response ===== ${response['status']}');
          Get.offNamed(AppRoute.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Phone Number or Email Already Exists");
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {}
  }

  @override
  goToSignInScreen() {
    Get.offAllNamed(AppRoute.login);
  }

  @override
  void onInit() {
    super.onInit();
    email = TextEditingController();
    password = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    phone.dispose();
    username.dispose();
    print('signup controller dispose');
  }
}
