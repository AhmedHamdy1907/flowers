import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../data/api/model/categories_Response/Categories.dart';

class CategoryViewModel extends ChangeNotifier
{
  List<CategoriesApi>?categories=[];
  String? errorMassage="";
  bool isLoading=false;
  bool noData = false;

  void getCategory()async
  {
    isLoading=true;
     noData = false;
    notifyListeners();
   try
       {
         var response= await ApiManger.getCategories();
         isLoading=false;
       if (response.message=="success")
       {
         if(response.categories!.isNotEmpty&&response.categories!=null)
         {
           categories=response.categories;
           noData=false;
           notifyListeners();
         }
         else
           {
             noData=true;
             notifyListeners();
           }
       }
       else
       {

         errorMassage=response.error;
       }
         notifyListeners();
       }
    catch(exception)
    {
      isLoading=false;
      errorMassage=exception.toString();
      notifyListeners();
    }
  }


}