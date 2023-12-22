class CategoriesModel {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateTime;

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDateTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDateTime = json['categories_datetime'];
  }
}

List<CategoriesModel> demoCategories = [
  CategoriesModel(
      categoriesId: 1,
      categoriesName: 'Headphones',
      categoriesNameAr: 'سماعات رأس',
      categoriesImage: '',
      categoriesDateTime: ''),
  CategoriesModel(
      categoriesId: 2,
      categoriesName: 'earphones',
      categoriesNameAr: 'سماعات اذن',
      categoriesImage: '',
      categoriesDateTime: ''),
  CategoriesModel(
      categoriesId: 3,
      categoriesName: 'cables',
      categoriesNameAr: 'كابلات',
      categoriesImage: '',
      categoriesDateTime: ''),
];
