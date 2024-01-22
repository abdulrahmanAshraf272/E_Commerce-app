import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:ecommerce_app/core/class/handling_data_view.dart';
import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(title: Text('Orders'), centerTitle: true),
      body: GetBuilder<OrdersController>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView.builder(
                  itemCount: controller.orders.length,
                  itemBuilder: ((context, index) =>
                      OrderListItem(order: controller.orders[index]))))),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final OrderModel order;
  const OrderListItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersController());
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: Offset(-4, 4),
            blurRadius: 2)
      ]),
      child: InkWell(
        onTap: () {
          controller.goToOrderDetailsPage(order);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text('Order Number: #${order.orderId}',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Spacer(),
                Text(
                    '${Jiffy(order.orderDatatime, "yyyy-MM-dd hh:mm:ss").fromNow()}',
                    style: TextStyle(fontSize: 16, color: Colors.orange)),
              ],
            ),
            Divider(),
            Text(
                'Order Status: ${order.orderStatus == 3 ? 'Complate' : 'Underway'}'),
            Text('Total Price: \$${order.totalPrice}'),
            Text(
                'Payment Method: ${order.paymentMethod == 0 ? 'cash' : 'credit card'}'),
            Text('Date: ${order.orderDatatime}'),
          ],
        ),
      ),
    );
  }
}
