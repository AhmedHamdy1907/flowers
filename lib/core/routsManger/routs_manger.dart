
import 'package:flutter/material.dart';

import '../../presentaion/Authentication/login_screen/view/login_screen.dart';
import '../../presentaion/Authentication/sign_up_screen/view/sign_up_screen.dart';
import '../../presentaion/BestSeller/view/BestSellerScreen.dart';
import '../../presentaion/Home/home.dart';
import '../../presentaion/Occasion/view/occasionScreen.dart';
import '../../presentaion/productDetails/view/productDetails.dart';

class RoutesManger
{
 static const String login="/login";
 static const String signUp="/SignUp";
 static const String home="/home";
 static const String bestSeller="/bestSeller";
 static const String productDetails="/productDetails";
 static const String occasionScreen="/OccasionScreen";



 static Map<String, WidgetBuilder > routs=
 {
  signUp:(BuildContext context)=>SignUpScreen(),
  login:(BuildContext context)=>LoginScreen(),
  home:(BuildContext context)=>Home(),
  bestSeller:(BuildContext context)=>BestSellerScreen(),
  productDetails:(BuildContext context)=>ProductDetails(),
  occasionScreen:(BuildContext context)=>OccasionScreen()

 };


}