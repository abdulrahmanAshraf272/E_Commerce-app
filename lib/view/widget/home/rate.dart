import 'package:flutter/material.dart';

class Rate extends StatelessWidget {
  final double rate;
  const Rate({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.orange,
          size: 18,
        ),
        SizedBox(
          width: 4,
        ),
        Text('$rate', style: TextStyle(fontSize: 12))
      ],
    );
  }
}
