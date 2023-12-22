import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeControllerImp());
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: TextField(
          controller: controller.searchController,
          cursorColor: Colors.grey,
          onChanged: controller.searchOnChange,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search'.tr,
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.grey),
        ),
      ),
    );
  }
}
