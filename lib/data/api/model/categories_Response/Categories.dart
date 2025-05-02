class CategoriesApi {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? productsCount;

  CategoriesApi({
      this.id, 
      this.name, 
      this.slug, 
      this.image, 
      this.createdAt, 
      this.updatedAt, 
      this.productsCount,});

  CategoriesApi.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productsCount = json['productsCount'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['productsCount'] = productsCount;
    return map;
  }

}