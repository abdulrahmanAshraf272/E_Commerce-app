import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardListItem extends StatelessWidget {
  final int index;

  const CardListItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (controller) {
      return Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                  '${AppLink.imagesItems}/${controller.cart[index].itemImage}',
                  fit: BoxFit.cover),
            ),
            Expanded(
                flex: 3,
                child: ListTile(
                  title: Text('${controller.cart[index].itemName}'),
                  subtitle: Text(
                    r'$' + '${controller.cart[index].itemsPrice}',
                    style: const TextStyle(color: Colors.orange, fontSize: 16),
                  ),
                )),
            Expanded(
                child: Column(
              children: [
                IconButton(
                    onPressed: () => controller.increaseAmountInCartPage(index),
                    icon: const Icon(Icons.add)),
                Text("${controller.cart[index].countItems}"),
                IconButton(
                    onPressed: () => controller.decreaseAmountInCartPage(index),
                    icon: const Icon(Icons.remove))
              ],
            ))
          ],
        ),
      );
    });
  }
}
