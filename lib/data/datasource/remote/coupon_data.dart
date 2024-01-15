import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class CouponData {
  Crud crud;
  CouponData(this.crud);

  checkCode(String code) async {
    var response = await crud.postData(AppLink.copounCheck, {"code": code});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }

  increaseCouponCounter(String code) async {
    var response = await crud.postData(AppLink.couponCounter, {"code": code});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }
}
