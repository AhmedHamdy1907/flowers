import 'package:flower/data/api/api_manger/api_manger.dart';
import 'package:flutter/material.dart';

import '../../../data/api/model/occasion_Response/Occasions.dart';

class OccasionViewModel extends ChangeNotifier
{
 List<Occasions>?occasions=[];
 String? errorMassage='';
 bool isLoading=false;
void getOccasion ()async
 {
  isLoading =true;
  notifyListeners();
  try
      {
       var response = await ApiManger.getOccasions();
       isLoading =false;
       notifyListeners();
       if(response.message=="success")
        {
         occasions=response.occasions;
         notifyListeners();
        }
       else
        {
         errorMassage=response.error;
         notifyListeners();
        }
      }
      catch (e)
  {
   errorMassage=e.toString();
   isLoading =false;
   notifyListeners();
  }

 }


}
