import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesTitleAndViewAll extends StatelessWidget {
  const CategoriesTitleAndViewAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Categories'.tr,
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {},
            child: Text(
              'View All'.tr,
              style: const TextStyle(fontSize: 12, color: Colors.orange),
            ))
      ],
    );
  }
}
