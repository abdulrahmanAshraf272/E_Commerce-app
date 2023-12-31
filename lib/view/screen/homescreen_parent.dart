import 'package:ecommerce_app/controller/homescreen_controller.dart';
import 'package:ecommerce_app/core/functions/alert_exit_app.dart';
import 'package:ecommerce_app/view/screen/cart.dart';
import 'package:ecommerce_app/view/widget/home_parent/custom_bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenParent extends StatelessWidget {
  const HomeScreenParent({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const Cart());
          },
          backgroundColor: Colors.orange,
          child: const Icon(
            Icons.shopping_bag_outlined,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const CustomBottomAppBar(),
        body: WillPopScope(
          onWillPop: alertExitApp,
          child: controller.listPage.elementAt(controller.currentPage),
        ),
      ),
    );
  }
}
