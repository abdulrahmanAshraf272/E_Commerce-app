import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppBarItem extends StatelessWidget {
  final int index;
  final String title;
  final IconData iconData;
  const BottomAppBarItem(
      {super.key,
      required this.index,
      required this.title,
      required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => MaterialButton(
            onPressed: () {
              controller.changePage(index);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  iconData,
                  color: controller.currentPage == index
                      ? Colors.orange
                      : Colors.grey,
                ),
                Text(title)
              ],
            )));
  }
}
