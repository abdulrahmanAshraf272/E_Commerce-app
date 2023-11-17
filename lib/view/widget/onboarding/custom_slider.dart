import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSlider extends GetView<OnBoardingControllerImp> {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: onBoardingList.length,
      itemBuilder: (context, index) => Column(
        children: [
          Text(onBoardingList[index].title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColor.black)),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Image.asset(
            onBoardingList[index].image,
            width: Get.width * 0.7,
            height: Get.width * 0.7,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: Get.height * 0.1,
          ),
          Container(
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(onBoardingList[index].body,
                  textAlign: TextAlign.center,
                  style: TextStyle(height: 2, color: AppColor.grey))),
        ],
      ),
    );
  }
}
