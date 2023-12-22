import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyButton extends StatelessWidget {
  final Function() onPress;
  const BuyButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: 45,
        margin: const EdgeInsets.only(top: 10),
        width: screenWidth * 0.60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        child: MaterialButton(
          onPressed: onPress,
          child: Text(
            'Buy Now'.tr,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ));
  }
}
