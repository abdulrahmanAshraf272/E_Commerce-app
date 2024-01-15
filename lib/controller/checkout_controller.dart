import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/datasource/remote/coupon_data.dart';
import 'package:ecommerce_app/data/datasource/remote/orders_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  int? paymentMethod;
  AddressModel? addressSelected;
  late String userid;
  AddressData addressData = AddressData(Get.find());
  StatusRequest addressStatusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<AddressModel> myAddresses = [];
  double couponDiscountPercentage = 0;
  double discount = 0;
  double totalPrice = 0;
  double shippingPrice = 0;
  String coupon = '';
  CouponData couponData = CouponData(Get.find());
  StatusRequest statusRequestCoupon = StatusRequest.none;

  OrdersData ordersData = OrdersData(Get.find());

  StatusRequest statusRequest = StatusRequest.none;
  bool couponChecked = false;

  //0 => cash, 1=> credit
  selectPaymentMethod(String method) {
    method == 'cash' ? paymentMethod = 0 : paymentMethod = 1;
    update();
  }

  selectAddress(AddressModel addressModel) {
    addressSelected = addressModel;
    update();
  }

  goToAddAddress() {
    Get.offNamed(AppRoute.addressView);
  }

  getAddress() async {
    myAddresses.clear();
    addressStatusRequest = StatusRequest.loading;
    var response = await addressData.addressView(
      myServices.sharedPreferences.getString("id")!,
    );
    addressStatusRequest = handlingData(response);
    if (addressStatusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        //Parsing operation
        List responseData = response['data'];
        myAddresses.addAll(responseData.map((e) => AddressModel.fromJson(e)));
      } else {
        //addressStatusRequest = StatusRequest.failure;
      }
    }
    update();
    if (myAddresses.length == 1) {
      addressSelected = myAddresses[0];
    }
  }

  increaseCouponCounter() async {
    var response = await couponData.increaseCouponCounter(coupon);
    statusRequestCoupon = handlingData(response);

    if (statusRequestCoupon == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('decrease counter done successfuly!');
      } else {
        print('failure');
      }
    }
  }

  orderNow() async {
    if (addressSelected == null) {
      Get.rawSnackbar(title: "تنبيه", message: 'اختر عنوانك الحالي');
    } else if (paymentMethod == null) {
      Get.rawSnackbar(title: 'تنبيه', message: 'اختر طريقة الدفع');
    } else {
      //Check if the coupon still valid. if now will send warning to the user
      if (couponDiscountPercentage != 0) {
        if (await isTheCouponValid() == false) {
          Get.rawSnackbar(
              title: 'Warning!', message: 'the coupon is not valid any more');
          return;
        }
      }
      statusRequest = StatusRequest.loading;
      update();
      var response = await ordersData.checkout(
          myServices.sharedPreferences.getString("id")!,
          addressSelected!.addressId.toString(),
          totalPrice.toString(),
          shippingPrice.toString(),
          discount.toString(),
          (couponDiscountPercentage * 100).toString(),
          paymentMethod.toString(),
          calcTotalPrice());

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          print('Response ===== ${response['status']}');
          //TODO : navigate to track order.
          Get.rawSnackbar(message: 'تم اضافة الطلب بنجاح!');
          increaseCouponCounter();
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Something wrong happend, try again.");
          statusRequest = StatusRequest.failure;
        }
        update();
      }
    }
  }

  String calcTotalPrice() {
    double priceFinal = (totalPrice - discount + shippingPrice) -
        (couponDiscountPercentage * (totalPrice - discount));
    return priceFinal.toString();
  }

  Future<bool> isTheCouponValid() async {
    var response = await couponData.checkCode(coupon);
    statusRequestCoupon = handlingData(response);
    if (statusRequestCoupon == StatusRequest.success) {
      if (response['message'] == 'valid') {
        couponDiscountPercentage = response['discount'] / 100;
        return true;
      } else {
        couponDiscountPercentage = 0;
        update();
        return false;
      }
    } else {
      Get.rawSnackbar(
          message: 'something wrong happend with coupon, try again');
      return false;
    }
  }

  recieveDataFromCart() {
    coupon = Get.arguments['coupon'];
    couponDiscountPercentage = Get.arguments["couponDiscount"];
    discount = Get.arguments["discount"];
    totalPrice = Get.arguments["totalPrice"];
    shippingPrice = Get.arguments["shipping"];
    print('coupon: $coupon');
    print(totalPrice);
    print(discount);
    print(shippingPrice);
  }

  @override
  void onInit() {
    super.onInit();
    recieveDataFromCart();
    getAddress();
  }
}
