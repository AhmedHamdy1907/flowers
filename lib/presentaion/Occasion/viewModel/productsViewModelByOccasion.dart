import 'package:flutter/cupertino.dart';

import '../../../../../data/api/api_manger/api_manger.dart';
import '../../../../../data/api/model/products_Response/Products.dart';

class ProductsViewModelByOccasion extends ChangeNotifier {
  List<ProductsApi>? products = [];
  String errorMessage = "";
  bool isLoading = false;
  bool noData = false;

  void getProducts({required String? id}) async {
    isLoading = true;
    noData = false;
    notifyListeners();

    try {
      var response = await ApiManger.getProductsByOccasion(occasionId: id);
      if (response.message == "success") {
        if (response.products == null || response.products!.isEmpty) {
          isLoading=false;
          noData = true;
        }
        else {
          products = response.products;
          isLoading = false;
        }
      } else {
        errorMessage = response.message ?? "Unknown error";
        isLoading = false;
      }
      notifyListeners(); // تأكد من تحديث واجهة المستخدم بعد أي تغيير
    }
    catch (e) {
      errorMessage = e.toString();
      isLoading = false;
      notifyListeners();
    }
  }
}
