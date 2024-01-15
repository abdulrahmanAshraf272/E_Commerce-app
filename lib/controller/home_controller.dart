import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/routes_name.dart';
import 'package:ecommerce_app/core/functions/handling_data_controller.dart';
import 'package:ecommerce_app/core/services/services.dart';
import 'package:ecommerce_app/data/datasource/remote/home_data.dart';
import 'package:ecommerce_app/data/model/categories_model.dart';
import 'package:ecommerce_app/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController with WidgetsBindingObserver {
  TextEditingController searchController = TextEditingController();
  MyServices myServices = Get.find();
  final favController = Get.put(FavoriteController());
  String? lang;
  String? username;
  String? idString;
  late int id;
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.loading;
  int selectedIndex = 0;
  List<CategoriesModel> categoriesDart = [];
  List categoriesJson = [];
  List itemsJson = [];
  List<ItemsModel> itemsDart = [];
  List<ItemsModel> itemsToDisplay = [];
  List<ItemsModel> searchedList = [];

  bool isSearching = false;

  saveFavInLocal() {
    itemsDart.forEach((item) {
      favController.isFavorite[item.itemsId] = item.favorite;
    });
  }

  selectCategorieItem(int index) {
    selectedIndex = index;
    update();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username") ?? "no name";
    idString = myServices.sharedPreferences.getString("id") ?? "0";
    id = int.parse(idString!);
  }

  @override
  getData() async {
    categoriesJson.clear();
    categoriesDart.clear();
    itemsJson.clear();
    itemsDart.clear();
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData(idString!);
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categoriesJson.addAll(response['categories']);
        categoriesDart =
            categoriesJson.map((e) => CategoriesModel.fromJson(e)).toList();

        itemsJson.addAll(response['items']);
        itemsDart = itemsJson.map((e) => ItemsModel.fromJson(e)).toList();
        makeListOfItems(categoriesDart[0].categoriesId!);

        saveFavInLocal();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }

  makeListOfItems(int foreignKey) {
    itemsToDisplay = [];
    for (int i = 0; i < itemsDart.length; i++) {
      if (itemsDart[i].itemsCategories == foreignKey) {
        itemsToDisplay.add(itemsDart[i]);
      }
    }
    update();
  }

  searchOnChange(String value) {
    if (value.isNotEmpty) {
      //Performance: to not rebuild in every litter .
      if (isSearching == false) {
        isSearching = true;
        update();
      }

      searchedList = itemsDart
          .where((element) =>
              element.itemsName!.startsWith(value) ||
              element.itemsNameAr!.startsWith(value))
          .toList();
      if (searchedList.isEmpty) {
        searchedList = itemsDart
            .where((element) =>
                element.itemsName!.contains(value) ||
                element.itemsNameAr!.contains(value))
            .toList();
      }
      update();
    } else {
      if (isSearching == true) {
        isSearching = false;
        update();
      }
      searchedList = [];
    }
  }

  clearTextField() {
    searchController.clear();
    isSearching = false;
    searchedList = [];
    update();
  }

  goToProductDetailsScreen(ItemsModel item) {
    Get.toNamed(
      AppRoute.productDetails,
      arguments: {"item": item},
    );
  }

  @override
  void onInit() {
    initialData();
    lang = myServices.sharedPreferences.getString('lang') ?? 'en';
    print('hello');
    getData();
    //saveFavInLocal();
    WidgetsBinding.instance?.addObserver(this);
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    WidgetsBinding.instance?.removeObserver(this);
    super.onClose();
  }

  //To upload the data form the database, if the user not closed the app, kept it in the background , and used it in next day.
  //TODO: think about it, remove it or keep it.
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      print('resumed');
      update();
      getData();
    }
  }
}
