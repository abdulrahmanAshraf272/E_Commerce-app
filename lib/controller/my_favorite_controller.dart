import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/my_favorite_data.dart';
import 'package:ecommerce_app/data/model/my_favorite_model.dart';
import 'package:get/get.dart';

class MYFavoriteController extends GetxController {
  late String userid;
  List<MyFavoriteModel> data = [];
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  getData() async {
    data.clear();

    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData.getData(userid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Response ===== ${response['status']}');
        List responseData = response['data'];
        data = responseData.map((e) => MyFavoriteModel.fromJson(e)).toList();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  //To update the UI when i remove
  deleteItemFromFav(var i) {
    data.remove(i);
    update();
  }

  @override
  void onInit() async {
    userid = await myServices.sharedPreferences.getString("id") ?? "0";
    getData();
    super.onInit();
  }
}
