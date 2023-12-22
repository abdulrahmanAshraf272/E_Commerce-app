import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late ItemsModel item;
  int _numberOfProdut = 1;

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
}
