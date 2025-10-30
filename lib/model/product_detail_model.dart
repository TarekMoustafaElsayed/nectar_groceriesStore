class ProductDetailModel {
  int? prodId;
  int? catId;
  int? brandId;
  int? typeId;
  String? name;
  String? detail;
  String? unitName;
  String? unitValue;
  String? nutritionWeight;
  double? price;
  String? createdDate;
  String? modifyDate;
  String? catName;
  bool? isFav;
  String? brandName;
  String? typeName;
  double? offerPrice;
  String? image;
  String? startDate;
  String? endDate;
  int? isOfferActive;

  ProductDetailModel(
      {this.prodId,
        this.catId,
        this.brandId,
        this.typeId,
        this.name,
        this.detail,
        this.unitName,
        this.unitValue,
        this.nutritionWeight,
        this.price,
        this.createdDate,
        this.modifyDate,
        this.catName,
        this.isFav,
        this.brandName,
        this.typeName,
        this.offerPrice,
        this.image,
        this.startDate,
        this.endDate,
        this.isOfferActive});

  ProductDetailModel.fromJson(Map<String, dynamic> json) {
    prodId = json['prod_id'];
    catId = json['cat_id'];
    brandId = json['brand_id'];
    typeId = json['type_id'];
    name = json['name'];
    detail = json['detail'];
    unitName = json['unit_name'];
    unitValue = json['unit_value'];
    nutritionWeight = json['nutrition_weight'];
    price = json['price'];
    createdDate = json['created_date'];
    modifyDate = json['modify_date'];
    catName = json['cat_name'];
    isFav = (json['is_fav'] as int ? ?? 0) == 1;
    brandName = json['brand_name'];
    typeName = json['type_name'];
    offerPrice = json['offer_price'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    isOfferActive = json['is_offer_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['prod_id'] = prodId;
    data['cat_id'] = catId;
    data['brand_id'] = brandId;
    data['type_id'] = typeId;
    data['name'] = name;
    data['detail'] = detail;
    data['unit_name'] = unitName;
    data['unit_value'] = unitValue;
    data['nutrition_weight'] = nutritionWeight;
    data['price'] = price;
    data['created_date'] = createdDate;
    data['modify_date'] = modifyDate;
    data['cat_name'] = catName;
    data['is_fav'] = isFav;
    data['brand_name'] = brandName;
    data['type_name'] = typeName;
    data['offer_price'] = offerPrice;
    data['image'] = image;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['is_offer_active'] = isOfferActive;
    return data;
  }
}