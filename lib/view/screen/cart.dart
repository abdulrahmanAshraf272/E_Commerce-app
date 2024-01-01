import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/cart/card_list_item.dart';
import 'package:ecommerce_app/view/widget/cart/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/view/widget/cart/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'My Cart',
                  style: TextStyle(
                      fontSize: 26,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                iconTheme: const IconThemeData(color: Colors.black),
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 1,
              ),
              bottomNavigationBar: controller.cart.isEmpty
                  ? null
                  : CustomBottomNavBar(
                      onPress: () {},
                      price: '${controller.totalPrice}',
                      shipping: '10',
                      totalPrice: (controller.totalPrice + 10).toString(),
                    ),
              body: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: controller.cart.isEmpty
                      ? const EmptyCart()
                      : ListView(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ...List.generate(controller.cart.length,
                                      (index) {
                                    return CardListItem(
                                      index: index,
                                    );
                                  })
                                ],
                              ),
                            )
                          ],
                        )),
            ));
  }
}

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/emptycart.png',
          width: Get.width * 0.5,
        ),
        Text('Your Cart Is Empty!')
      ],
    ));
  }
}
