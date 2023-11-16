import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String txt;
  const CustomTextBodyAuth({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: Text(txt,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
