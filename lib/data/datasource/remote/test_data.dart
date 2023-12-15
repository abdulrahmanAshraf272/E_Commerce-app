import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class TestData {
  Crud crud;
  TestData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.test, {});
    return response.fold((leftValue) {
      print(leftValue);
      return leftValue;
    }, (rightValue) {
      print(rightValue);
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
