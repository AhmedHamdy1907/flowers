import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flutter/material.dart';

import '../../../data/api/model/best_seller_Response/BestSeller.dart';
import '../../../data/api/model/best_seller_Response/BestSellerResponse.dart';

class BestSellerViewmodel extends ChangeNotifier {
  List<BestSellerApi>? bestSeller = [];
  String? errorMassage = "";
  bool isLoading = false;

  void getBestSeller() async {
    isLoading = true;
    notifyListeners();
    try {
      BestSellerResponse response = await ApiManger.getBestSeller();
      if (response.message == "success")
      {
        bestSeller = response.bestSeller;
        isLoading=false;
      }
      else {
        errorMassage = response.message;
        isLoading=false;
      }
      notifyListeners();
    } catch (e) {
      errorMassage = e.toString();
      isLoading=false;
      notifyListeners();
    }
  }
}
