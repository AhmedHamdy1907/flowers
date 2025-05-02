import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/best_seller_Response/BestSellerResponse.dart';
import '../model/categories_Response/CatgoriesRespones.dart';
import '../model/occasion_Response/OccasionResponse.dart';
import '../model/productsSpesefic_Response/PrductsSpesificResponse.dart';
import '../model/products_Response/ProductsResponse.dart';
class ApiManger {
  static const String _baseUrl = "flower.elevateegy.com";
  static const String _categoriesEndPoint = "/api/v1/categories";
  static const String _productEndPoint = "/api/v1/products";
  static const String _bestSellerEndPoint = "/api/v1/best-seller";
  static const String _occasionsEndPoint = "/api/v1/occasions";





  static Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.https(_baseUrl, _categoriesEndPoint);
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    return categoriesResponse;
  }
  static Future<ProductsResponse> getProductsByCategory({ String? categoriesId}) async {
    Uri url;

    if (categoriesId != null) {
      url = Uri.https(_baseUrl, _productEndPoint, {
        "category": categoriesId,
      });
    } else {
      url = Uri.https(_baseUrl, _productEndPoint);
    }

    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsResponse productsResponse = ProductsResponse.fromJson(json);
    return productsResponse;
  }
  static Future<ProductsSpecificResponse> getProductSpecificByID({String? id}) async {
        Uri url = Uri.https(_baseUrl,'$_productEndPoint/$id');

    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsSpecificResponse productsResponse = ProductsSpecificResponse.fromJson(json);
    return productsResponse;
  }
  static Future<BestSellerResponse> getBestSeller ()async {
    Uri url =Uri.https(_baseUrl,_bestSellerEndPoint);
    http.Response serverResponse=  await http.get(url);
    var json =jsonDecode(serverResponse.body);
    BestSellerResponse bestSellerResponse=BestSellerResponse.fromJson(json);
    return bestSellerResponse;





  }
  static Future<OccasionResponse> getOccasions() async {
    Uri url = Uri.https(_baseUrl, _occasionsEndPoint);
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    OccasionResponse occasionResponse = OccasionResponse.fromJson(json);
    return occasionResponse;
  }
  static Future<ProductsResponse> getProductsByOccasion({ String? occasionId}) async {
    Uri url = Uri.https(_baseUrl, _productEndPoint, {"occasion": occasionId,});
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsResponse productsResponse = ProductsResponse.fromJson(json);
    return productsResponse;
  }




}





