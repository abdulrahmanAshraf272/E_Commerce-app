import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.login, {
      "email": email,
      "password": password,
    });

    print('=========== login done ==========');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
