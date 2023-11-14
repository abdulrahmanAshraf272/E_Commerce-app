import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotController extends StatelessWidget {
  const CustomDotController({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 5),
                    duration: const Duration(milliseconds: 300),
                    width: controller.currentPage == index ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ],
      ),
    );
  }
}
