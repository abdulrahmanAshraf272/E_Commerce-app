class AddressModel {
  int? addressId;
  int? addressUsersid;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressBuilding;
  String? addressFloor;
  double? addressLat;
  double? addressLong;

  AddressModel(
      {this.addressId,
      this.addressUsersid,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressBuilding,
      this.addressFloor,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'];
    addressUsersid = json['address_usersid'];
    addressName = json['address_name'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressBuilding = json['address_building'];
    addressFloor = json['address_floor'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
  }
}
