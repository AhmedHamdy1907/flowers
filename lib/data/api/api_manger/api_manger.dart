import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/best_seller_Response/BestSellerResponse.dart';
import '../model/categories_Response/CatgoriesRespones.dart';
import '../model/occasion_Response/OccasionResponse.dart';
import '../model/productsSpesefic_Response/PrductsSpesificResponse.dart';
import '../model/products_Response/ProductsResponse.dart';
import '../model/sign_in_Response/SignInResponse.dart';
import '../model/sign_up_Response/SignUpResponse.dart';

class ApiManger {
  static const String _baseUrl = "flower.elevateegy.com";
  static const String _categoriesEndPoint = "/api/v1/categories";
  static const String _productEndPoint = "/api/v1/products";
  static const String _bestSellerEndPoint = "/api/v1/best-seller";
  static const String _occasionsEndPoint = "/api/v1/occasions";
  static const String _signUPEndPoint = "/api/v1/auth/signup";
  static const String _signInEndPoint = "/api/v1/auth/signin";

  static Future<CategoriesResponse> getCategories() async {
    Uri url = Uri.https(_baseUrl, _categoriesEndPoint);
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    CategoriesResponse categoriesResponse = CategoriesResponse.fromJson(json);
    return categoriesResponse;
  }

  static Future<ProductsResponse> getProductsByCategory({
    String? categoriesId,
  }) async {
    Uri url;

    if (categoriesId != null) {
      url = Uri.https(_baseUrl, _productEndPoint, {"category": categoriesId});
    } else {
      url = Uri.https(_baseUrl, _productEndPoint);
    }

    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsResponse productsResponse = ProductsResponse.fromJson(json);
    return productsResponse;
  }

  static Future<ProductsSpecificResponse> getProductSpecificByID({
    String? id,
  }) async {
    Uri url = Uri.https(_baseUrl, '$_productEndPoint/$id');

    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsSpecificResponse productsResponse =
        ProductsSpecificResponse.fromJson(json);
    return productsResponse;
  }

  static Future<BestSellerResponse> getBestSeller() async {
    Uri url = Uri.https(_baseUrl, _bestSellerEndPoint);
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    BestSellerResponse bestSellerResponse = BestSellerResponse.fromJson(json);
    return bestSellerResponse;
  }

  static Future<OccasionResponse> getOccasions() async {
    Uri url = Uri.https(_baseUrl, _occasionsEndPoint);
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    OccasionResponse occasionResponse = OccasionResponse.fromJson(json);
    return occasionResponse;
  }

  static Future<ProductsResponse> getProductsByOccasion({
    String? occasionId,
  }) async {
    Uri url = Uri.https(_baseUrl, _productEndPoint, {"occasion": occasionId});
    http.Response serverResponse = await http.get(url);
    var json = jsonDecode(serverResponse.body);
    ProductsResponse productsResponse = ProductsResponse.fromJson(json);
    return productsResponse;
  }

  static Future<SignUpResponse> createAccount({
    required String email,
    required String lastName,
    required String firstName,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  })
  async {
    Uri url = Uri.https(
      _baseUrl,
      _signUPEndPoint,
    ); // تأكد إنك بتستخدم https هنا
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phone": phone,
        "password": password,
        "rePassword": rePassword,
        "gender": gender,
      }),
    );
    print("Status Code: ${response.statusCode}");
    print("Body: ${response.body}");
    var json = jsonDecode(response.body);
    var signUpResponse = SignUpResponse.fromJson(json);
    return signUpResponse;
  }

  static Future<SignInResponse> accountLogin({
    required String? email,
    required String? password,
  }) async {
    Uri url = Uri.https(_baseUrl, _signInEndPoint);
   var response= await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body:jsonEncode({
        "email":email,
        "password":password
      }),
    );
    var json=jsonDecode(response.body);
    var signInResponse=SignInResponse.fromJson(json);
    return signInResponse;
  }
}

//   static Future<SignUpResponse> createAccount({
//     required String email,
//     required String lastName,
//     required String firstName,
//     required String password,
//     required String rePassword,
//     required String gender,
//     required String phone
//   })async {
//     Uri url = Uri.http(_baseUrl, _signUPEndPoint);
//    var response=await http.post(url, body: {
//         "firstName": firstName,
//         "lastName": lastName,
//         "email": email,
//         "phone": phone,
//         "password": password,
//         "rePassword":rePassword,
//         "gender": gender,
//       },);
//    var json =jsonDecode(response.body);
//    print(json);
//     var signUpResponse=SignUpResponse.fromJson(json);
//    return signUpResponse;
//   }
// }
