import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/core/localization/change_locale.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:ecommerce_app/view/screen/language.dart';
import 'package:ecommerce_app/view/screen/onboarding.dart';
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
      title: 'Flutter Demo',
      locale: controller.language,
      theme: ThemeData(
          textTheme: const TextTheme(
              displayLarge: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColor.black),
              bodyLarge: TextStyle(height: 2, color: AppColor.grey)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primarySwatch: Colors.blue),
      routes: routes,
      home: const Language(),
    );
  }
}
