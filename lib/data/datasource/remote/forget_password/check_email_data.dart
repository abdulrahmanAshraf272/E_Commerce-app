import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmail, {"email": email});

    print('=========== done');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
