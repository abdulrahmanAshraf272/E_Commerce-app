import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/address/custom_text_form.dart';
import 'package:ecommerce_app/view/widget/cart/custom_button_order.dart';
import 'package:ecommerce_app/view/widget/cart/order_price_details.dart';
import 'package:ecommerce_app/view/widget/checkout/payment_method.dart';
import 'package:ecommerce_app/view/widget/checkout/select_address.dart';
import 'package:ecommerce_app/view/widget/custom_text_form_general.dart';
import 'package:ecommerce_app/view/widget/home_parent/custom_bottomappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: true,
      ),
      bottomNavigationBar: CustomButtonOrder(
        textButton: 'Order now',
        onPress: () {
          controller.orderNow();
        },
      ),
      body: GetBuilder<CheckoutController>(
          builder: (controller) => ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const PaymentMethod(),
                        const SizedBox(height: 16),
                        const SelectAddress(),
                        const SizedBox(height: 10),
                        const Text('Payment Summary',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        OrderPriceDetails(
                            price: controller.totalPrice,
                            shipping: controller.shippingPrice,
                            totalDiscount: controller.discount,
                            couponDiscountPercentage:
                                controller.couponDiscountPercentage)
                      ],
                    ),
                  ),
                ],
              )),
    );
  }
}
