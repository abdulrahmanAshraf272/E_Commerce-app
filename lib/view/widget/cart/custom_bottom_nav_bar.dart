import 'package:ecommerce_app/view/widget/cart/custom_button_order.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String price;
  final String shipping;
  final String totalPrice;
  final Function() onPress;

  const CustomBottomNavBar(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalPrice,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Price:",
                  style: TextStyle(
                    fontSize: 18,
                  )),
              Text(
                r'$' + '$price',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Shipping:", style: TextStyle(fontSize: 18)),
              Text(
                r'$' + '$shipping',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Price:",
                  style: TextStyle(fontSize: 18, color: Colors.orange)),
              Text(
                r'$' + '$totalPrice',
                style: TextStyle(fontSize: 18, color: Colors.orange),
              )
            ],
          ),
          CustomButtonOrder(
            onPress: onPress,
            textButton: 'Place Order',
          ),
        ],
      ),
    );
  }
}
