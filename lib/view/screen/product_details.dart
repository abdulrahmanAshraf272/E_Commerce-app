import 'package:auto_size_text/auto_size_text.dart';
import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:ecommerce_app/core/functions/translate_database.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:ecommerce_app/view/widget/home/rate.dart';
import 'package:ecommerce_app/view/widget/product_details/add_to_card_button.dart';
import 'package:ecommerce_app/view/widget/product_details/buy_button.dart';
import 'package:ecommerce_app/view/widget/product_details/number_of_product.dart';
import 'package:ecommerce_app/view/widget/product_details/product_categorie_text.dart';
import 'package:ecommerce_app/view/widget/product_details/product_info_text.dart';
import 'package:ecommerce_app/view/widget/product_details/product_name_and_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    final controller = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      body: SafeArea(
        child: Column(
          children: [
            Hero(
              tag: '${controller.item.itemsId}',
              child: Image.network(
                '${AppLink.imagesItems}/${controller.item.itemsImage}',
                height: screenHeight * 0.4,
                width: screenWidth,
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductCategorieText(
                            categorieName: translateDatabase(
                                controller.item.categoriesNameAr!,
                                controller.item.categoriesName!),
                          ),
                          const SizedBox(height: 12),
                          ProductNameAndPrice(
                            productName: translateDatabase(
                                controller.item.itemsNameAr!,
                                controller.item.itemsName!),
                            productPrice: controller.item.itemsPrice!,
                          ),
                          const SizedBox(height: 12),
                          const Row(
                            children: [
                              Rate(rate: 4.5),
                              Spacer(),
                              NumberOfProduct()
                            ],
                          ),
                          const SizedBox(height: 10),
                          ProductInfoText(
                            productDescription: translateDatabase(
                                controller.item.itemsDescAr!,
                                controller.item.itemsDesc!),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: AddToCardButton(onPress: () {})),
                      const SizedBox(width: 10),
                      BuyButton(onPress: () {})
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
