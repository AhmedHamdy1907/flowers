import 'Product_specific.dart';

class ProductsSpecificResponse {
  String? message;
  ProductSpecificApi? product;
  String?error;
  ProductsSpecificResponse({
    this.error,
      this.message, 
      this.product,});

  ProductsSpecificResponse.fromJson(dynamic json) {
    error=json["error"];
    message = json['message'];
    product = json['product'] != null ? ProductSpecificApi.fromJson(json['product']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (product != null) {
      map['product'] = product?.toJson();
    }
    return map;
  }

}