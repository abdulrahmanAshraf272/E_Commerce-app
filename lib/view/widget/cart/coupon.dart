import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/functions/valid_input.dart';
import 'package:ecommerce_app/view/widget/custom_text_form_general.dart';
import 'package:get/get.dart';

class Coupon extends StatelessWidget {
  const Coupon({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.formstate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextFormGeneral(
                        hintText: "enter coupon code",
                        labelText: "Coupon code",
                        textEditingController:
                            controller.couponCodeTextController,
                        valid: (val) {
                          return validInput(val!, 0, 30, '');
                        }),
                  ),
                  const SizedBox(width: 10),
                  Container(
                      width: 100,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: MaterialButton(
                            onPressed: () {
                              controller.checkCouponCode();
                            },
                            textColor: Colors.white,
                            color: Colors.orange,
                            child: Text('Apply')),
                      ))
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: controller.statusRequestCoupon == StatusRequest.loading
                    ? SizedBox(width: 100, child: LinearProgressIndicator())
                    : Text(
                        controller.couponMessage,
                        style: TextStyle(color: controller.couponMessageColor),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
