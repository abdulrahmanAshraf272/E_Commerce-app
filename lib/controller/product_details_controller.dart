import 'package:ecommerce_app/controller/cart_controller.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  addToCard();
  buyNow();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  CartController cartController = Get.put(CartController(), permanent: true);

  late ItemsModel item;

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

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    item = Get.arguments['item'];
  }

  @override
  addToCard() {
    cartController.cartAdd(
        item.itemsId!.toString(), _numberOfProdut.toString(), true);
    added = true;
  }

  @override
  buyNow() async {
    if (added == false) {
      await cartController.cartAdd(
          item.itemsId!.toString(), _numberOfProdut.toString(), false);
      added = true;
      Get.offNamed(AppRoute.cart);
    } else {
      Get.offNamed(AppRoute.cart);
    }
  }
}
