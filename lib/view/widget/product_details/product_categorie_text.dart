import 'package:flutter/material.dart';

class ProductCategorieText extends StatelessWidget {
  final String categorieName;
  const ProductCategorieText({super.key, required this.categorieName});

  @override
  Widget build(BuildContext context) {
    return Text(
      categorieName,
      style: TextStyle(fontSize: 12, color: Colors.black.withOpacity(0.3)),
    );
  }
}
