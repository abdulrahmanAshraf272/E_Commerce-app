import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class CartData {
  Crud crud;
  CartData(this.crud);

  cartAdd(String usersid, itemsid, numberOfProduct) async {
    var response = await crud.postData(AppLink.cartAdd, {
      "usersid": usersid,
      "itemsid": itemsid,
      "numberOfProduct": numberOfProduct
    });
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }

  cartDelete(String usersid, itemsid) async {
    var response = await crud
        .postData(AppLink.cartDelete, {"usersid": usersid, "itemsid": itemsid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }

  cartView(String userid) async {
    var response = await crud.postData(AppLink.cartView, {
      "usersid": userid,
    });
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }
}
