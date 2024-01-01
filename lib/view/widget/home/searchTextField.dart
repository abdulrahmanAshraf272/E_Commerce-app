import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: GetBuilder<HomeControllerImp>(
                builder: (controller) => TextField(
                  controller: controller.searchController,
                  cursorColor: Colors.grey,
                  onChanged: controller.searchOnChange,
                  decoration: controller.isSearching
                      ? InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search'.tr,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.grey,
                          suffixIcon: IconButton(
                            onPressed: () => controller.clearTextField(),
                            icon: const Icon(Icons.close),
                          ))
                      : InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search'.tr,
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Get.toNamed(AppRoute.myFavorite);
            },
            icon: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black.withOpacity(0.5),
            ))
      ],
    );
  }
}
