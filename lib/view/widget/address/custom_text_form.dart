import 'package:flutter/material.dart';

class CustomTextFormAddress extends StatelessWidget {
  final String hintText;
  final String labelText;

  final TextEditingController textEditingController;
  final String? Function(String?) valid;
  const CustomTextFormAddress({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: textEditingController,
        validator: valid,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(fontSize: 14),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(labelText)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }
}
