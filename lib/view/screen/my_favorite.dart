import 'package:ecommerce_app/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/my_favorite/fav_card_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: GetBuilder<MYFavoriteController>(
        init: MYFavoriteController(),
        builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: GridView.builder(
                        itemCount: controller.data.length,
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
                          return MyFavoriteCardItem(
                            item: controller.data[index],
                          );
                        }),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
