
import 'package:flutter/material.dart';

import '../../presentaion/BestSeller/view/BestSellerScreen.dart';
import '../../presentaion/Home/home.dart';
import '../../presentaion/Occasion/view/occasionScreen.dart';
import '../../presentaion/productDetails/view/productDetails.dart';

class RoutesManger
{
 static const String home="/home";
 static const String bestSeller="/bestSeller";
 static const String productDetails="/productDetails";
 static const String occasionScreen="/OccasionScreen";



 static Map<String, WidgetBuilder > routs=
 {
  home:(BuildContext context)=>Home(),
  bestSeller:(BuildContext context)=>BestSellerScreen(),
  productDetails:(BuildContext context)=>ProductDetails(),
  occasionScreen:(BuildContext context)=>OccasionScreen()

 };


}