import 'Metadata.dart';
import 'Categories.dart';

class CategoriesResponse {
  String? message;
  String? error;
  Metadata? metadata;
  List<CategoriesApi>? categories;

  CategoriesResponse({
      this.message, 
      this.metadata, 
      this.categories,});

  CategoriesResponse.fromJson(dynamic json) {
    error=json["error"];
    message=json["message"];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories?.add(CategoriesApi.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (categories != null) {
      map['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}