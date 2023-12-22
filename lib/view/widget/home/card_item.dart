import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:ecommerce_app/view/widget/home/rate.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  final ItemsModel item;
  const CardItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => InkWell(
              onTap: () {
                controller.goToProductDetailsScreen(item);
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
                            translateDatabase(
                                item.itemsNameAr!, item.itemsName!),
                            maxLines: 1,
                            style: const TextStyle(fontSize: 16)),
                        Text(
                            translateDatabase(
                                item.categoriesNameAr!, item.categoriesName!),
                            style: const TextStyle(fontSize: 12)),
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
                            Image.asset('assets/images/card_orange_icon.png')
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ));
  }
}
