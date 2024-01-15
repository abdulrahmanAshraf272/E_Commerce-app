import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrderModel order;
  double totalPrice = 0;
  double shippingPrice = 0;
  double discount = 0;
  double couponDiscountPercentage = 0;
  @override
  void onInit() {
    super.onInit();
    order = Get.arguments['order'];
    totalPrice = order.orderPrice!.toDouble();
    shippingPrice = order.shipping!.toDouble();
    discount = order.discount!.toDouble();
    couponDiscountPercentage = order.couponDiscount!.toDouble() / 100;
  }
}
