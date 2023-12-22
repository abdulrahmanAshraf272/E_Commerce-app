import 'package:ecommerce_app/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberOfProduct extends StatelessWidget {
  const NumberOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsControllerImp>(
      builder: (controller) => Row(
        children: [
          Container(
            width: 40,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                onPressed: () {
                  controller.increaseNumberOfProduct();
                },
                child: const Text('+'),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Text(controller.getNumberOfProdut().toString()),
          const SizedBox(width: 14),
          Container(
            width: 40,
            height: 30,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.withOpacity(0.1)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: MaterialButton(
                onPressed: () {
                  controller.deacreaseNumberOfProduct();
                },
                child: const Text('-'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
