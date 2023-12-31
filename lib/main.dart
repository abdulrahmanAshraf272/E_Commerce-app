import 'package:ecommerce_app/binding/initial_binding.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/localization/change_locale.dart';
import 'package:ecommerce_app/core/localization/translation.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      title: 'E commerce',
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      translations: MyTranslation(),
      theme: controller.appTheme,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }

  TextTheme customTextTheme() {
    return const TextTheme(
        displayLarge: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 26, color: AppColor.black),
        displayMedium: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 24, color: AppColor.black),
        bodyLarge: TextStyle(height: 2, color: AppColor.grey));
  }
}
