import 'package:ecommerce_app/controller/cart_controller.dart';
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
                    subtitle: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text:
                              '\$${(controller.cart[index].itemPrice! - controller.cart[index].itemDiscount!) * controller.cart[index].countItems!} ',
                          style: const TextStyle(
                              color: Colors.orange, fontSize: 16),
                        ),
                        controller.cart[index].itemDiscount != 0
                            ? TextSpan(
                                text:
                                    '\$${(controller.cart[index].itemPrice! * controller.cart[index].countItems!)}',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough),
                              )
                            : TextSpan()
                      ]),
                    ))),
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
