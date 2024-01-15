import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class OrdersData {
  Crud crud;
  OrdersData(this.crud);

  checkout(
      String userid,
      String addressid,
      String price,
      String shipping,
      String discount,
      String couponDiscount,
      String paymentMethod,
      String totalPrice) async {
    var response = await crud.postData(AppLink.checkout, {
      "usersid": userid,
      "addressid": addressid,
      "price": price,
      "shipping": shipping,
      "discount": discount,
      "couponDiscount": couponDiscount,
      "paymentMethod": paymentMethod,
      "totalPrice": totalPrice
    });
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }

  getAllOrders(String usersid) async {
    var response = await crud.postData(AppLink.allOrders, {"userid": usersid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }
}
