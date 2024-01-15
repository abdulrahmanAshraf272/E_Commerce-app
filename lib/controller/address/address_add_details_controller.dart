import 'package:ecommerce_app/controller/address/addres_view_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/address_data.dart';
import 'package:ecommerce_app/data/model/address_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class AddressAddDetailsController extends GetxController {
  addAddress();
}

class AddressAddDetailsControllerImp extends AddressAddDetailsController {
  late TextEditingController nameTextController;
  late TextEditingController cityTextController;
  late TextEditingController streetTextController;
  late TextEditingController buildingNoTextController;
  late TextEditingController floorTextController;

  AddressData addressAddData = AddressData(Get.find());
  MyServices myServices = Get.find();
  String lat = '22.2';
  String long = '34.3';
  StatusRequest statusRequest = StatusRequest.none;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  addAddress() async {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      var response = await addressAddData.addressAdd(
          myServices.sharedPreferences.getString("id")!,
          nameTextController.text,
          cityTextController.text,
          streetTextController.text,
          buildingNoTextController.text,
          floorTextController.text,
          lat,
          long);

      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          print('Response ===== ${response['status']}');
          //Get.back();
          Get.offNamed(AppRoute.addressView);
          Get.rawSnackbar(message: 'تم اضافة العنوان بنجاح!');
        } else {
          Get.defaultDialog(
              title: "Warning",
              middleText: "Something wrong happend, try again.");
          statusRequest = StatusRequest.failure;
        }
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    nameTextController = TextEditingController();
    cityTextController = TextEditingController();
    streetTextController = TextEditingController();
    buildingNoTextController = TextEditingController();
    floorTextController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    nameTextController.dispose();
    cityTextController.dispose();
    streetTextController.dispose();
    buildingNoTextController.dispose();
    floorTextController.dispose();
  }
}
