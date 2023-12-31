import 'package:ecommerce_app/view/screen/home.dart';
import 'package:ecommerce_app/view/screen/settings.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int currentpage);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  List<Widget> listPage = [
    const HomeScreen(),
    const SettingsPage(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('Profile'))],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Center(child: Text('Favorate'))],
    )
  ];
  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
}
