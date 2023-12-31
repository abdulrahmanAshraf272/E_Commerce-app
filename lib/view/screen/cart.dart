import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/cart/card_list_item.dart';
import 'package:ecommerce_app/view/widget/cart/custom_bottom_nav_bar.dart';
import 'package:ecommerce_app/view/widget/cart/top_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.put(CartController());
    controller.cartView();
  }

  @override
  Widget build(BuildContext context) {
    //controller.cartView();
    return GetBuilder<CartController>(
        builder: (controller) => Scaffold(
              bottomNavigationBar: CustomBottomNavBar(
                onPress: () {},
                price: '${controller.totalPrice}',
                shipping: '10',
                totalPrice: (controller.totalPrice + 10).toString(),
              ),
              body: HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView(
                    children: [
                      const TopAppBar(txt: 'My Cart'),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            ...List.generate(controller.cart.length, (index) {
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
