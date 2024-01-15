import 'package:ecommerce_app/controller/address/address_add_details_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:get/get.dart';

abstract class AddressViewController extends GetxController {
  getData();
  deleteData(AddressModel addressModel);
}

class AddressViewControllerImp extends AddressViewController {
  late String userid;
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  List<AddressModel> myAddresses = [];

  @override
  getData() async {
    myAddresses.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.addressView(
      myServices.sharedPreferences.getString("id")!,
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('View Address ===== ${response['status']}');
        //Parsing operation
        List responseData = response['data'];

        myAddresses.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        print(myAddresses[0].addressCity);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  deleteData(AddressModel addressModel) async {
    //remove from ui(local list).
    myAddresses.remove(addressModel);
    //remove from database.
    var response = await addressData.addressDelete(
      addressModel.addressId.toString(),
    );

    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Delete Address ===== ${response['status']}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToAddAddress() {
    if (myAddresses.length < 4) {
      Get.offNamed(AppRoute.addressAddDetails);
    } else {
      Get.rawSnackbar(message: "you can't add more than 4 address");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
