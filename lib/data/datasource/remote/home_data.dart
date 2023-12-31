import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData(String userid) async {
    var response = await crud.postData(AppLink.home, {"userid": userid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
