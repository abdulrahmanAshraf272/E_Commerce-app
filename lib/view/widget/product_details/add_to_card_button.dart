import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCardButton extends StatelessWidget {
  final Function() onPress;
  const AddToCardButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        margin: const EdgeInsets.only(top: 10, right: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.withOpacity(0.2)),
        child: Center(
          child: AutoSizeText(
            'Add to card'.tr,
            maxLines: 1,
            style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.bold,
                fontSize: 11),
          ),
        ),
      ),
    );
  }
}
