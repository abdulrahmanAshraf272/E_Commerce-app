import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoToSignInButton extends StatelessWidget {
  final Function() onPress;
  const GoToSignInButton({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("have an account?",
            style: TextStyle(color: Colors.black.withOpacity(0.5))),
        TextButton(
            onPressed: onPress,
            child: const Text(
              "Sign In",
            ))
      ],
    );
  }
}
