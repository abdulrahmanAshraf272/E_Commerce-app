import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 20),
      child: Image.asset(
        AppImageAssets.logoImage,
        height: Get.height * 0.2,
      ),
    );
  }
}
