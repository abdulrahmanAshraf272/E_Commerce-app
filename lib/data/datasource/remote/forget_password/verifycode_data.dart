import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeForgetPassword,
        {"email": email, "verifycode": verifycode});

    print('=========== done');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
