import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(
        AppLink.resetPassword, {"email": email, "password": password});

    print('=========== done');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
