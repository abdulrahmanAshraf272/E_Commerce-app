import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrderModel order;
  double totalPrice = 0;
  double shippingPrice = 0;
  double discount = 0;
  double couponDiscountPercentage = 0;

  StatusRequest statusRequest = StatusRequest.loading;
  OrdersData ordersData = OrdersData(Get.find());

  List<CartModel> cart = [];

  getOrderDetails() async {
    cart.clear();
    statusRequest = StatusRequest.loading;
    var response = await ordersData.getOrderDetails(order.orderId!.toString());

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Order details View ===== ${response['status']}');
        //Parsing operation
        List responseData = response['data'];
        cart.addAll(responseData.map((e) => CartModel.fromJson(e)));
        print(cart[0].itemName);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    order = Get.arguments['order'];
    totalPrice = order.orderPrice!.toDouble();
    shippingPrice = order.shipping!.toDouble();
    discount = order.discount!.toDouble();
    couponDiscountPercentage = order.couponDiscount!.toDouble() / 100;

    getOrderDetails();
  }
}
