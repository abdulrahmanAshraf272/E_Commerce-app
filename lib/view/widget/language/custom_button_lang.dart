import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonLang extends StatelessWidget {
  final String textButton;
  final void Function()? onPressed;
  const CustomButtonLang({super.key, required this.textButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 100),
        width: double.infinity,
        child: MaterialButton(
          color: AppColor.primaryColor,
          textColor: Colors.white,
          onPressed: onPressed,
          child: Text(textButton,
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ));
  }
}
