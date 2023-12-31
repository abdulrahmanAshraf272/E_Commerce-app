import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/my_favorite_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/my_favorite_model.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:ecommerce_app/view/widget/home/rate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavoriteCardItem extends StatelessWidget {
  final MyFavoriteModel item;
  const MyFavoriteCardItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final myFavController = Get.put(MYFavoriteController());
    return InkWell(
      onTap: () {
        //controller.goToProductDetailsScreen(item);
      },
      child: Container(
        height: screenHeight * 0.26,
        width: screenWidth * 0.4,
        decoration: BoxDecoration(
            color: Color(0xFFECECEC),
            borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(13),
                topLeft: Radius.circular(13),
                topRight: Radius.circular(13)),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 2),
                  blurRadius: 2,
                  color: Colors.black.withOpacity(0.15))
            ]),
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Hero(
                tag: '${item.itemsId}',
                child: Image.network(
                  '${AppLink.imagesItems}/${item.itemsImage}',
                ),
              ),
            ),
          ),
          Container(
            //height: screenHeight * 0.13,
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(13),
                  topLeft: Radius.circular(13),
                  topRight: Radius.circular(13)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                    translateDatabase(item.itemsNameAr!, item.itemsName!),
                    maxLines: 1,
                    style: const TextStyle(fontSize: 16)),
                Row(
                  children: [
                    Column(
                      children: [
                        const Rate(rate: 4.5),
                        const SizedBox(height: 3),
                        RichText(
                            text: TextSpan(
                                style: const TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                                children: [
                              const TextSpan(text: r'$'),
                              TextSpan(text: '${item.itemsPrice}')
                            ]))
                      ],
                    ),
                    const Spacer(),
                    GetBuilder<FavoriteController>(
                        builder: (controller) => IconButton(
                              onPressed: () {
                                //To remove item form database.
                                controller.setFavorite(item.itemsId!, 0);
                                controller
                                    .favoriteRemove(item.itemsId!.toString());
                                //to remove item from UI
                                myFavController.deleteItemFromFav(item);
                              },
                              icon: Icon(Icons.delete_outlined),
                              color: Colors.orange,
                            ))
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
