import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/localization/change_locale.dart';
import 'package:ecommerce_app/view/widget/language/custom_button_lang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Choose Language'.tr,
                style: Theme.of(context).textTheme.displayLarge),
            const SizedBox(height: 20),
            CustomButtonLang(
                textButton: 'Arabic'.tr,
                onPressed: () {
                  controller.changeLang('ar');
                  Get.toNamed(AppRoute.onBoarding);
                }),
            CustomButtonLang(
                textButton: 'English'.tr,
                onPressed: () {
                  controller.changeLang('en');
                  Get.toNamed(AppRoute.onBoarding);
                })
          ],
        ),
      ),
    );
  }
}
