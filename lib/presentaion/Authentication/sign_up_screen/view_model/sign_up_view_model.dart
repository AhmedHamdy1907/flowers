import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flower/data/api/model/sign_up_Response/User.dart';
import 'package:flutter/widgets.dart';

import '../../../../data/api/model/sign_up_Response/SignUpResponse.dart';

class SignUpViewModel extends ChangeNotifier {
  UserSignUp? user;
  bool isLoading = false;
  String? massage;
  String? error;
  void createAccount({
    required String email,
    required String lastName,
    required String firstName,
    required String password,
    required String rePassword,
    required String gender,
    required String phone,
  })async {
    isLoading = true;
    notifyListeners();
    try {
      SignUpResponse response = await ApiManger.createAccount(
        email: email,
        lastName: lastName,
        firstName: firstName,
        password: password,
        rePassword: rePassword,
        gender: gender,
        phone: phone,
      );

      if (response.message=="success")
        {
          user=response.user;
          isLoading=false;
          massage="Registration successful";
          error="";
          notifyListeners();
        }
      else
        {
          error=response.error;
          massage=null;
          isLoading=false;
          notifyListeners();
        }

    } catch (e)
    {
      error=e.toString();
      isLoading=false;
      notifyListeners();
    }
  }
}
