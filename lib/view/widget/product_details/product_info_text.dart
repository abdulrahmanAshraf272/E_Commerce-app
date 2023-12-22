import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductInfoText extends StatelessWidget {
  final String productDescription;
  const ProductInfoText({super.key, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Product Info'.tr,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        const SizedBox(height: 12),
        Text(
          productDescription,
          style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.7)),
        ),
      ],
    );
  }
}
