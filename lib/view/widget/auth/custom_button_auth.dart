import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonAuth extends StatelessWidget {
  final String textButton;
  final void Function() onPressed;
  const CustomButtonAuth(
      {super.key, required this.textButton, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width - 40,
        height: 45,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: MaterialButton(
            color: AppColor.primaryColor,
            textColor: Colors.white,
            onPressed: onPressed,
            child: Text(textButton,
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ));
  }
}
