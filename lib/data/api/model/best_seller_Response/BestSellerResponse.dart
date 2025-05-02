import 'BestSeller.dart';

class BestSellerResponse {
  String? message;
  List<BestSellerApi>? bestSeller;
  String? error ;
  BestSellerResponse({
      this.message, 
      this.bestSeller,
    this.error

  });

  BestSellerResponse.fromJson(dynamic json) {
    error=json['error'];
    message = json['message'];
    if (json['bestSeller'] != null) {
      bestSeller = [];
      json['bestSeller'].forEach((v) {
        bestSeller?.add(BestSellerApi.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (bestSeller != null) {
      map['bestSeller'] = bestSeller?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}