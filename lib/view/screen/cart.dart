import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/view/widget/cart/card_list_item.dart';
import 'package:ecommerce_app/view/widget/cart/coupon.dart';
import 'package:ecommerce_app/view/widget/cart/custom_app_bar.dart';
import 'package:ecommerce_app/view/widget/cart/order_price_details.dart';
import 'package:ecommerce_app/view/widget/cart/custom_button_order.dart';
import 'package:ecommerce_app/view/widget/cart/empty_card_warning.dart';
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
              appBar: customAppBar(),
              bottomNavigationBar: controller.cart.isEmpty
                  ? null
                  : CustomButtonOrder(
                      textButton: 'Place Order',
                      onPress: () {
                        controller.goToCheckout();
                      }),
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
                            ),
                            Divider(
                              thickness: 2,
                              endIndent: 20,
                              indent: 20,
                              color: Colors.black.withOpacity(0.1),
                            ),
                            const Coupon(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: OrderPriceDetails(
                                price: controller.totalPrice,
                                shipping: 10,
                                totalDiscount: controller.totalDiscount,
                                couponDiscountPercentage:
                                    controller.couponDiscountPercentage,
                              ),
                            )
                          ],
                        )),
            ));
  }
}
