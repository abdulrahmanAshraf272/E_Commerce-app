import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/link_api.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => SizedBox(
              height: 45,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(right: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.categoriesDart.length,
                  itemBuilder: (context, index) => CategoriesListItem(
                        categoriesModel: controller.categoriesDart[index],
                        index: index,
                      )),
            ));
  }
}

class CategoriesListItem extends StatelessWidget {
  final CategoriesModel categoriesModel;
  final int index;

  const CategoriesListItem(
      {super.key, required this.categoriesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => GestureDetector(
        onTap: () {
          controller.selectCategorieItem(index);
          controller.makeListOfItems(categoriesModel.categoriesId!);
        },
        child: Container(
          height: 45,
          width: 150,
          margin: const EdgeInsets.only(left: 16),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: controller.selectedIndex == index
                  ? Colors.orange
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.network(
                '${AppLink.imagesCategories}/${categoriesModel.categoriesImage}',
                color: controller.selectedIndex == index
                    ? Colors.white
                    : Colors.black.withOpacity(0.6),
                width: 24,
              ),
              const SizedBox(width: 7),
              Text(
                translateDatabase(categoriesModel.categoriesNameAr!,
                    categoriesModel.categoriesName!),
                style: TextStyle(
                    color: controller.selectedIndex == index
                        ? Colors.white
                        : Colors.black.withOpacity(0.6)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
