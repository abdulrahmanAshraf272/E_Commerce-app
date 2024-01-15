import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/datasource/remote/coupon_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  late String userid;
  CartData cartData = CartData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  List<CartModel> cart = [];
  double totalPrice = 0;
  int amountOfProduct = 1;
  double totalDiscount = 0;
  double shipping = 10;
  double couponDiscountPercentage = 0;

  late TextEditingController couponCodeTextController;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CouponData couponData = CouponData(Get.find());
  StatusRequest statusRequestCoupon = StatusRequest.none;
  String couponMessage = '';
  Color couponMessageColor = Colors.green;

  // double priceAfterDiscount = 0;

  // calcPriceAfterDiscount() {
  //   priceAfterDiscount =
  //       totalPrice + shipping - totalDiscount - couponDiscountPercentage;
  // }

  cartAdd(String itemsid, String numberOfProduct, [showAlertAdd = true]) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartAdd(
        myServices.sharedPreferences.getString("id")!,
        itemsid,
        numberOfProduct);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        showAlertAdd
            ? Get.rawSnackbar(title: "الاشعار", message: 'تم اضافة المنتج')
            : null;
        print('Cart Add ===== ${response['status']}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  cartDelete(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartDelete(
      myServices.sharedPreferences.getString("id")!,
      itemsid,
    );
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Cart Delete ===== ${response['status']}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  cartView() async {
    cart.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.cartView(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Cart View ===== ${response['status']}');
        //Parsing operation
        totalPrice = double.parse(response['count&price']['totalprice']);
        amountOfProduct = int.parse(response['count&price']['totalcount']);
        List responseData = response['data'];
        cart.addAll(responseData.map((e) => CartModel.fromJson(e)));

        getTotalDiscount();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getTotalDiscount() {
    totalDiscount = 0;
    for (int i = 0; i < cart.length; i++) {
      totalDiscount += cart[i].countItems! * cart[i].itemDiscount!;
    }
  }

  decreaseAmountInCartPage(int index) {
    cartDelete(cart[index].itemId.toString());
    totalPrice -= cart[index].itemPrice!;

    int amount = cart[index].countItems!;
    if (amount > 1) {
      cart[index].countItems = --amount;
    } else {
      cart.remove(cart[index]);
    }

    getTotalDiscount();
  }

  increaseAmountInCartPage(int index) {
    cartAdd(cart[index].itemId.toString(), '1', false);
    totalPrice += cart[index].itemPrice!;
    cart[index].countItems = cart[index].countItems! + 1;

    getTotalDiscount();
  }

  checkCouponCode() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequestCoupon = StatusRequest.loading;
      update();

      var response = await couponData.checkCode(couponCodeTextController.text);
      await Future.delayed(Duration(seconds: 2));
      statusRequestCoupon = handlingData(response);

      if (statusRequestCoupon == StatusRequest.success) {
        if (response['message'] == 'valid') {
          couponDiscountPercentage = response['discount'] / 100;
          couponMessage = 'Discount Added Successfuly';
          couponMessageColor = Colors.green;
        } else if (response['message'] == 'not exist') {
          couponDiscountPercentage = 0;
          couponMessage = 'Coupon Code Is Not Correct, Try Again.';
          couponMessageColor = Colors.red;
        } else {
          couponDiscountPercentage = 0;
          couponMessage = 'Coupon Is Expired';
          couponMessageColor = Colors.red;
        }
        print('Coupon state ===== ${response['message']}');
      }
      update();
    }
  }

  goToCheckout() {
    if (cart.isNotEmpty) {
      Get.toNamed(AppRoute.checkout, arguments: {
        'coupon': couponCodeTextController.text,
        "couponDiscount": couponDiscountPercentage,
        'discount': totalDiscount,
        'totalPrice': totalPrice,
        'shipping': shipping
      });
    } else {
      Get.rawSnackbar(title: 'Warning', message: 'Your cart is empty!');
    }
  }

  @override
  void onInit() {
    super.onInit();
    couponCodeTextController = TextEditingController();
    cartView();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    couponCodeTextController.dispose();
  }
}
