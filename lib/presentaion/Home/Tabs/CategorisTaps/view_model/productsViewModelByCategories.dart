import 'package:flutter/cupertino.dart';

import '../../../../../data/api/api_manger/api_manger.dart';
import '../../../../../data/api/model/products_Response/Products.dart';

class ProductsViewModelByCategories extends ChangeNotifier {
  List<ProductsApi>? products = [];
  String errorMessage = "";
  bool isLoading = false;
  bool noData = false;

  void getProducts({required String? id}) async {
    isLoading = true;
    errorMessage = "";
    noData = false;
    notifyListeners();

    try {
      var response = await ApiManger.getProductsByCategory(categoriesId: id);

      if (response.message == "success") {
        if (response.products == null || response.products!.isEmpty) {
          noData = true;
        } else {
          products = response.products;
        }
      }
      else
      {
        errorMessage = response.message ?? "Unknown error";
      }


    } catch (e) {
      errorMessage = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
