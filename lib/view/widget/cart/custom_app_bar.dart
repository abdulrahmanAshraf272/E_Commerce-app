import 'package:flutter/material.dart';

AppBar customAppBar() {
  return AppBar(
    title: const Text(
      'My Cart',
      style: TextStyle(
          fontSize: 26, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 1,
  );
}
