import 'package:ecommerce_app/view/widget/home_parent/bottomappbar_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        //padding: const EdgeInsets.symmetric(vertical: 7),
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BottomAppBarItem(
                    index: 0, title: 'Home'.tr, iconData: Icons.home),
                BottomAppBarItem(
                    index: 1, title: 'Settings'.tr, iconData: Icons.settings),
                const SizedBox(width: 40),
                BottomAppBarItem(
                    index: 2, title: 'Profile'.tr, iconData: Icons.person),
                BottomAppBarItem(
                    index: 3, title: 'Favorate'.tr, iconData: Icons.favorite),
              ],
            )
          ],
        ));
  }
}
