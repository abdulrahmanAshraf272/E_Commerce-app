import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  favoriteAdd(String userid, itemid) async {
    var response = await crud
        .postData(AppLink.favoriteAdd, {"userid": userid, "itemid": itemid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }

  favoriteRemove(String userid, itemid) async {
    var response = await crud
        .postData(AppLink.favoriteRemove, {"userid": userid, "itemid": itemid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }

  favoriteView(String userid) async {
    var response = await crud.postData(AppLink.favoriteView, {
      "id": userid,
    });
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }
}
