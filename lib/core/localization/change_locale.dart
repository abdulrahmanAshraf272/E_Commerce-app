import 'package:ecommerce_app/core/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString('lang', langcode);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    super.onInit();

    String? sharedPrefs = myServices.sharedPreferences.getString('lang');
    if (sharedPrefs == 'ar') {
      language = const Locale('ar');
    } else if (sharedPrefs == 'en') {
      language = const Locale('en');
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
    }
  }
}
