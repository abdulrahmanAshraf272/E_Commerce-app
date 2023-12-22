import 'package:flutter/material.dart';

class ProductNameAndPrice extends StatelessWidget {
  final String productName;
  final int productPrice;
  const ProductNameAndPrice(
      {super.key, required this.productName, required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(productName,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        const Spacer(),
        RichText(
            text: TextSpan(
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
                children: [
              const TextSpan(text: r'$'),
              TextSpan(text: '$productPrice')
            ]))
      ],
    );
  }
}
