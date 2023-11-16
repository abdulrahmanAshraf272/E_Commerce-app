import 'package:flutter/material.dart';

class CustomTitleAuth extends StatelessWidget {
  final String txt;
  const CustomTitleAuth({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayLarge);
  }
}
