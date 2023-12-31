import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  late String userid;
  FavoriteData favoriteData = FavoriteData(Get.find());
  late StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();

  Map isFavorite = {};

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  changeFavState(int itemsId) async {
    if (isFavorite[itemsId] == 1) {
      //to change fav state in local
      setFavorite(itemsId, 0);
      //to change fav state in Database.
      await favoriteRemove(itemsId.toString());
    } else {
      //to change fav state in local
      setFavorite(itemsId, 1);
      //To change fav state in Database.
      await favoriteAdd(itemsId.toString());
    }
  }

  favoriteAdd(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteAdd(userid, itemsid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Response ===== ${response['status']}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  favoriteRemove(String itemsid) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.favoriteRemove(userid, itemsid);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        print('Response ===== ${response['status']}');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() async {
    userid = await myServices.sharedPreferences.getString("id") ?? "0";
    super.onInit();
  }
}
