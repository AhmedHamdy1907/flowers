import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flower/data/api/model/sign_in_Response/User.dart';
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier
{
UserSignIn? userSignIn;
String? error;
String? token;
bool isLoading=false;
void loginUser ({required String?email,required String? password}) async
{
 isLoading=true;
 notifyListeners();
 try
 {
   var response= await ApiManger.accountLogin(email: email, password: password);
   if(response.message=="success")
     {
       userSignIn=response.user;
       token=response.token;
       error=null;
       isLoading=false;
       notifyListeners();
     }
   else
     {
       error=response.error;
       isLoading=false;
       notifyListeners();
     }
 }
     catch(e)
  {
    error=e.toString();
    isLoading=false;
    notifyListeners();
  }
}
}