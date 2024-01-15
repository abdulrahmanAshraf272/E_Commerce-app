import 'package:flutter/material.dart';

class ProductNameAndPrice extends StatelessWidget {
  final String productName;
  final productPrice;
  final discount;
  const ProductNameAndPrice(
      {super.key,
      required this.productName,
      required this.productPrice,
      required this.discount});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
                children: [
              TextSpan(text: '\$${productPrice - discount}'),
              discount != 0
                  ? TextSpan(
                      text: '\n\$$productPrice',
                      style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal))
                  : TextSpan()
            ]))
      ],
    );
  }
}
