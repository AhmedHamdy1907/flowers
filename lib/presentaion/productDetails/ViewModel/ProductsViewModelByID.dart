import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flutter/material.dart';

import '../../../data/api/model/productsSpesefic_Response/Product_specific.dart';

class ProductsViewModelByID extends ChangeNotifier {
 ProductSpecificApi? products;
  String? errorMassage="";
  bool isLoading = false;

  void getProductsByID({ String? id}) async {
    isLoading = true;
    notifyListeners();
    try {
      var response = await ApiManger.getProductSpecificByID(id:id);
      isLoading = false;
      notifyListeners();
      if (response.message == "success")
      {
        products=response.product;
        notifyListeners();
      } else
      {
        errorMassage = response.error;
        notifyListeners();
      }
    }
    catch (e)
    {
      isLoading =false;
      errorMassage = e.toString();
      notifyListeners();
    }

  }
}
