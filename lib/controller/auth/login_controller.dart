import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpScreen();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  LoginData loginData = LoginData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  bool passwordVisible = true;

  MyServices myServices = Get.find();

  showPassword() {
    passwordVisible = !passwordVisible;
    update();
  }

  @override
  login() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(
          emailController.text, passwordController.text);
      statusRequest = handlingData(response);
      print(statusRequest);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          if (response['data']['users_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['users_id'].toString());
            myServices.sharedPreferences
                .setString("username", response['data']['users_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['users_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPreferences.setString("step", "2");
            Get.offNamed(AppRoute.home);
          } else {
            Get.offNamed(AppRoute.verifyCodeSignUp,
                arguments: {"email": emailController.text});
          }
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "the email or password is not correct!");
          statusRequest = StatusRequest.failure;
        }
      }

      update();
    } else {
      //print('Not Valid');
    }
  }

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

    FirebaseMessaging.instance.getToken().then((value) {
      print(value);
      String? token = value;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.checkEmail);
  }
}
