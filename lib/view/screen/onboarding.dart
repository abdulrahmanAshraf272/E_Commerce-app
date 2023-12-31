import 'package:ecommerce_app/controller/onboarding_controller.dart';

import 'package:ecommerce_app/view/widget/onboarding/custom_button.dart';
import 'package:ecommerce_app/view/widget/onboarding/custom_dot_controller.dart';
import 'package:ecommerce_app/view/widget/onboarding/custom_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: CustomSlider(),
            ),
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    CustomDotController(),
                    Spacer(flex: 2),
                    CustomButton()
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
