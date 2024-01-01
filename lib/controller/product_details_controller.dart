import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/cart_data.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addToCard();
  buyNow();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel item;
  late String userid;
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  bool added = false;

  int _numberOfProdut = 1;

  //to get how many amount of product do i added to the cart.

  getNumberOfProdut() => _numberOfProdut;

  increaseNumberOfProduct() {
    if (_numberOfProdut < 40) {
      _numberOfProdut++;
      update();
    }
  }

  deacreaseNumberOfProduct() {
    if (_numberOfProdut > 1) {
      _numberOfProdut--;
      update();
    }
  }

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

  @override
  addToCard() {
    cartAdd(item.itemsId!.toString(), _numberOfProdut.toString(), true);
    added = true;
  }

  @override
  buyNow() async {
    if (added == false) {
      await cartAdd(
          item.itemsId!.toString(), _numberOfProdut.toString(), false);
      added = true;
      Get.offNamed(AppRoute.cart);
    } else {
      Get.offNamed(AppRoute.cart);
    }
  }

  @override
  void onInit() {
    super.onInit();
    item = Get.arguments['item'];
    added = false;
  }
}
