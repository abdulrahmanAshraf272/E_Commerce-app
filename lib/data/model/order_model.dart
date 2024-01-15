class OrderModel {
  int? orderId;
  int? userId;
  int? addressId;
  int? orderPrice;
  int? shipping;
  int? discount;
  int? couponDiscount;
  int? totalPrice;
  int? paymentMethod;
  int? orderStatus;
  String? orderDatatime;

  OrderModel(
      {this.orderId,
      this.userId,
      this.addressId,
      this.orderPrice,
      this.shipping,
      this.discount,
      this.couponDiscount,
      this.totalPrice,
      this.paymentMethod,
      this.orderStatus,
      this.orderDatatime});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orders_id'];
    userId = json['orders_usersid'];
    addressId = json['orders_addressid'];
    orderPrice = json['orders_price'];
    shipping = json['orders_shipping'];
    discount = json['orders_discount'];
    couponDiscount = json['orders_coupon_discount'];
    totalPrice = json['orders_total_price'];
    paymentMethod = json['orders_payment_method'];
    orderStatus = json['orders_status'];
    orderDatatime = json['orders_datetime'];
  }
}
