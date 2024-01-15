import 'package:ecommerce_app/controller/order_details_controller.dart';
import 'package:ecommerce_app/link_api.dart';
import 'package:ecommerce_app/view/widget/cart/order_price_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(title: Text('Order Details'), centerTitle: true),
      body: GetBuilder<OrderDetailsController>(
        builder: (controller) => ListView(
          children: [
            Card(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.network(
                          '${AppLink.imagesItems}/iphoneheadphones.png',
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: ListTile(
                          title: Text('heaphone'),
                          subtitle: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: '\$20',
                                style: const TextStyle(
                                    color: Colors.orange, fontSize: 16),
                              ),
                              TextSpan(
                                text: '\$20',
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    decoration: TextDecoration.lineThrough),
                              )
                            ]),
                          ))),
                  Expanded(
                      child: Column(
                    children: [
                      Text("2"),
                    ],
                  ))
                ],
              ),
            ),
            OrderStatusAndPaymentMethod(
              orderStatus:
                  'Order Status:  ${controller.order.orderStatus == 3 ? 'Complate' : 'Underway'}',
              paymentMethod:
                  'Payment Method:  ${controller.order.paymentMethod == 0 ? 'cash' : 'credit card'}',
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: OrderPriceDetails(
                  price: controller.totalPrice,
                  shipping: controller.shippingPrice,
                  totalDiscount: controller.discount,
                  couponDiscountPercentage:
                      controller.couponDiscountPercentage),
            )
          ],
        ),
      ),
    );
  }
}

class OrderStatusAndPaymentMethod extends StatelessWidget {
  final String orderStatus;
  final String paymentMethod;
  const OrderStatusAndPaymentMethod(
      {super.key, required this.orderStatus, required this.paymentMethod});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(orderStatus, style: TextStyle(fontSize: 18)),
          Text(paymentMethod, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
