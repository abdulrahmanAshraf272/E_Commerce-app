import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/order_model.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  MyServices myServices = Get.find();
  OrdersData ordersData = OrdersData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  List<OrderModel> orders = [];

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersData
        .getAllOrders(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        List data = response['data'];
        orders = data.map((e) => OrderModel.fromJson(e)).toList();
        print(orders[0].couponDiscount);
      } else {
        //failure means there is no data,
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToOrderDetailsPage(OrderModel order) {
    Get.toNamed(AppRoute.orderDetails, arguments: {'order': order});
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
