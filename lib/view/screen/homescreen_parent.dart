import 'package:ecommerce_app/controller/homescreen_controller.dart';
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
          onPressed: () {},
          child: const Icon(
            Icons.shopping_bag_outlined,
          ),
          backgroundColor: Colors.orange,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: CustomBottomAppBar(),
        body: controller.listPage.elementAt(controller.currentPage),
      ),
    );
  }
}
