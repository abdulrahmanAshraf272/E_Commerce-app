import 'package:dartz/dartz_unsafe.dart';
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

class HomeControllerImp extends HomeController {
  TextEditingController searchController = TextEditingController();
  MyServices myServices = Get.find();
  String? lang;
  String? username;
  String? id;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  int selectedIndex = 0;
  List<CategoriesModel> categoriesDart = [];
  List categoriesJson = [];
  List itemsJson = [];
  List<ItemsModel> itemsDart = [];
  List itemsToDisplay = [];

  selectCategorieItem(int index) {
    selectedIndex = index;
    update();
  }

  @override
  initialData() {
    username = myServices.sharedPreferences.getString("username") ?? "no name";
    id = myServices.sharedPreferences.getString("id") ?? "0";
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);

    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        categoriesJson.addAll(response['categories']);
        categoriesDart =
            categoriesJson.map((e) => CategoriesModel.fromJson(e)).toList();

        itemsJson.addAll(response['items']);

        itemsDart = itemsJson.map((e) => ItemsModel.fromJson(e)).toList();

        makeListOfItems(categoriesDart[0].categoriesId!);
        print('Response ===== ${response['status']}');
        print('categories list $categoriesDart');
        print('items list $itemsDart');
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
    if (itemsDart.contains(value)) {}
    //TODO: add the process of search of the product.
  }

  goToProductDetailsScreen(ItemsModel item) {
    Get.toNamed(AppRoute.productDetails, arguments: {"item": item});
  }

  @override
  void onInit() {
    lang = myServices.sharedPreferences.getString('lang') ?? 'en';

    print(lang);
    //print(categoriesDart[0].categoriesNameAr);
    getData();
    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
  }
}
