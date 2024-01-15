import 'package:flutter/material.dart';

class OrderPriceDetails extends StatelessWidget {
  final double price;
  final double shipping;
  final double totalDiscount;
  final double couponDiscountPercentage;
  const OrderPriceDetails(
      {super.key,
      required this.price,
      required this.shipping,
      required this.totalDiscount,
      required this.couponDiscountPercentage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Price:", style: customTextStyle()),
            Text('\$$price', style: customTextStyle())
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Shipping:", style: customTextStyle()),
            Text(
              '+ \$$shipping',
              style: customTextStyle(),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Discount:", style: customTextStyle()),
            Text(
              '- \$$totalDiscount',
              style: customTextStyle(),
            )
          ],
        ),
        couponDiscountPercentage != 0
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Discount coupon %${(couponDiscountPercentage * 100).toInt()}:",
                      style: customTextStyle()),
                  Text(
                    '- \$${(couponDiscountPercentage * (price - totalDiscount))}',
                    style: customTextStyle(),
                  )
                ],
              )
            : const SizedBox(),
        const Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Total Price:", style: customTextStyle(Colors.orange)),
            Text(
              '\$${price + shipping - totalDiscount - (couponDiscountPercentage * (price - totalDiscount))}',
              style: customTextStyle(Colors.orange),
            )
          ],
        ),
      ],
    );
  }

  TextStyle customTextStyle([Color color = Colors.black]) =>
      TextStyle(fontSize: 18, color: color);
}
