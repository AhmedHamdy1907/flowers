import 'Metadata.dart';
import 'Products.dart';

class ProductsResponse {
  String? message;
  String? error;
  Metadata? metadata;

  List<ProductsApi>? products;

  ProductsResponse({
      this.message, 
      this.metadata, 
      this.products,});

  ProductsResponse.fromJson(dynamic json) {
    message = json['message'];
    error=json["error"];
    metadata = json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(ProductsApi.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}