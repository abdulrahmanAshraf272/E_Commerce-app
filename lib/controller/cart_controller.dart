import 'package:dartz/dartz_streaming.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/cart_model.dart';
import 'package:ecommerce_app/test.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  late String userid;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  List<CartModel> cart = [];
  double totalPrice = 0;
  int amountOfProduct = 1;

  // Map<int, int> amount = {};
  // addToMapAmout(int itemsid, int number) {
  //   amount[itemsid] = number;
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
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  decreaseAmountInCartPage(int index) {
    int amount = cart[index].countItems!;
    if (amount > 1) {
      cartDelete(cart[index].itemId.toString());
      double priceOfOneItem = cart[index].itemPrice!.toDouble();
      double priceOfTotalItems = double.parse(cart[index].itemsPrice!);
      priceOfTotalItems -= priceOfOneItem;
      totalPrice -= priceOfOneItem;
      cart[index].itemsPrice = priceOfTotalItems.toString();
      amount--;
      cart[index].countItems = amount;
    } else {
      cartDelete(cart[index].itemId.toString());
      totalPrice -= cart[index].itemPrice!;
      cart.remove(cart[index]);
    }
  }

  increaseAmountInCartPage(int index) {
    // int amount = cartModel.itemCount!;
    cartAdd(cart[index].itemId.toString(), '1', false);
    totalPrice += cart[index].itemPrice!;
    cart[index].countItems = cart[index].countItems! + 1;
    double priceOfOneItem = cart[index].itemPrice!.toDouble();
    double priceOfTotalItems = double.parse(cart[index].itemsPrice!);
    priceOfTotalItems += priceOfOneItem;
    cart[index].itemsPrice = priceOfTotalItems.toString();
  }
}
