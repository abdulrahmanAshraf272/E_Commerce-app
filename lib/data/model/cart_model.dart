class CartModel {
  String? itemsPrice;
  int? countItems;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  int? itemId;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemActive;
  int? itemPrice;
  int? itemDiscount;
  String? itemDate;
  int? itemCategories;

  CartModel(
      {this.itemsPrice,
      this.countItems,
      this.cartId,
      this.cartUsersid,
      this.cartItemsid,
      this.itemId,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemActive,
      this.itemPrice,
      this.itemDiscount,
      this.itemDate,
      this.itemCategories});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsPrice = json['itemsprice'];
    countItems = json['countitems'];
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
    itemId = json['items_id'];
    itemName = json['items_name'];
    itemNameAr = json['items_name_ar'];
    itemDesc = json['items_desc'];
    itemDescAr = json['items_desc_ar'];
    itemImage = json['items_image'];
    itemCount = json['items_count'];
    itemActive = json['items_active'];
    itemPrice = json['items_price'];
    itemDiscount = json['items_discount'];
    itemDate = json['items_date'];
    itemCategories = json['items_categories'];
  }
}
