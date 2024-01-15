import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
        builder: (controller) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment Method',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectPaymentMethod('cash');
                      },
                      child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 1.5)),
                          child: controller.paymentMethod == 0
                              ? Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange),
                                )
                              : const SizedBox()),
                    ),
                    const SizedBox(width: 5),
                    const Text('Cash', style: TextStyle(fontSize: 18))
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.selectPaymentMethod('visa');
                      },
                      child: Container(
                          width: 25,
                          height: 25,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.grey, width: 1.5)),
                          child: controller.paymentMethod == 1
                              ? Container(
                                  width: 15,
                                  height: 15,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.orange),
                                )
                              : const SizedBox()),
                    ),
                    const SizedBox(width: 5),
                    const Text('Credit Card', style: TextStyle(fontSize: 18))
                  ],
                )
              ],
            ));
  }
}
