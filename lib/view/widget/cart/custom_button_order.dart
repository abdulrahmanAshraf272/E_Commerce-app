import 'package:flutter/material.dart';

class CustomButtonOrder extends StatelessWidget {
  final String textButton;
  final void Function() onPress;
  const CustomButtonOrder(
      {super.key, required this.textButton, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        height: 50,
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPress,
          color: Colors.orange,
          textColor: Colors.white,
          child:
              Text(textButton, style: TextStyle(fontWeight: FontWeight.bold)),
        ));
  }
}
