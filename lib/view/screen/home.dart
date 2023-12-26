import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/core/constant/app_colors.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:ecommerce_app/view/widget/home/card_item.dart';
import 'package:ecommerce_app/view/widget/home/categories.dart';
import 'package:ecommerce_app/view/widget/home/categories_title_and_viewall.dart';
import 'package:ecommerce_app/view/widget/home/searchTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return GetBuilder<HomeControllerImp>(
      builder: (controller) => HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: Column(
          children: [
            Image.asset(
              'assets/images/headphone_image1.png',
              fit: BoxFit.cover,
              width: screenWidth,
              height: screenHeight * 0.35,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SearchTextField(),
                  SizedBox(height: 20),
                  CategoriesTitleAndViewAll(),
                  SizedBox(height: 8),
                ],
              ),
            ),
            const Categories(),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                    itemCount: controller.itemsToDisplay.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.67,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 30,
                    ),
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 20, top: 10),
                    itemBuilder: (context, index) {
                      // == add favorite from data came from database to favorite controller var (local)
                      // favoriteController
                      //         .isFavorite[controller.itemsDart[index].itemsId] =
                      //     controller.itemsDart[index].favorite;
                      return CardItem(
                        item: controller.itemsToDisplay[index],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
