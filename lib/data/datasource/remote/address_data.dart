import 'package:ecommerce_app/core/class/crud.dart';
import 'package:ecommerce_app/link_api.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addressAdd(String usersid, String addressName, String city, String street,
      String buildingNo, String floor, String lat, String long) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": usersid,
      "name": addressName,
      "city": city,
      "street": street,
      "building": buildingNo,
      "floor": floor,
      "lat": lat,
      "long": long
    });
    print('address add data is clear');
    return response.fold((leftValue) {
      print(leftValue);
      return leftValue;
    }, (rightValue) {
      print(rightValue);
      return rightValue;
    });

    //returnresponse.fold((l) => l, (r) => r);
  }

  addressView(String usersid) async {
    var response =
        await crud.postData(AppLink.addressView, {"usersid": usersid});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }

  addressDelete(String addressId) async {
    var response =
        await crud.postData(AppLink.addressDelete, {"address_id": addressId});
    return response.fold((leftValue) {
      return leftValue;
    }, (rightValue) {
      return rightValue;
    });
    //returnresponse.fold((l) => l, (r) => r);
  }

  addressEdit(String addressId, String addressName, String city, String street,
      String buildingNo, String floor, String lat, String long) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "address_id": addressId,
      "name": addressName,
      "city": city,
      "street": street,
      "building": buildingNo,
      "floor": floor,
      "lat": lat,
      "long": long
    });
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
