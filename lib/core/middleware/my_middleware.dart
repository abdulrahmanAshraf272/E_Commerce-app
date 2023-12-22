import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyMiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String step = myServices.sharedPreferences.getString('step') ?? '0';
    if (step == '2') {
      return const RouteSettings(name: AppRoute.home);
    }
    if (step == '1') {
      return const RouteSettings(name: AppRoute.login);
    }
  }
}
