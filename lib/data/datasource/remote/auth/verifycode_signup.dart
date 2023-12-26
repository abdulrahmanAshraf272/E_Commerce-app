import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class VerifycodeSignup {
  Crud crud;
  VerifycodeSignup(this.crud);

  postData(String email, String verifycode) async {
    var response = await crud.postData(
        AppLink.verifycode, {"email": email, "verifycode": verifycode});

    print('=========== done');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }

  resendVerifycode(String email) async {
    var response = await crud.postData(AppLink.resend, {"email": email});

    print('=========== done');

    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
  }
}
