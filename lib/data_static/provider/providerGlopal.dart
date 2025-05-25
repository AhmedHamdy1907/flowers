import 'package:flutter/material.dart';

class ProviderGlobal extends ChangeNotifier {
 int? indexTapBarCategories;
 String? idCategories;
 int? selectedTabs=0;


 void changeSelectedTabs(int newSelectedTabs) {
   if( selectedTabs==newSelectedTabs)return;
   selectedTabs=newSelectedTabs;
   notifyListeners();
 }
 void changeIndexTabBarCategories(int newIndex) {
  if (indexTapBarCategories == newIndex) return;
  indexTapBarCategories = newIndex;
  notifyListeners();
 }
 void changIdCategories(String? newId) {
  if (newId == idCategories) return; // لو نفس الـ id ما نغيرش
  idCategories = newId;  // تحديد الـ id الجديد
  notifyListeners();  // التحديث للمستمعين
 }
// String ? resultSignUp;
//
//
// void changeResultSignUp(String?massage)
// {
//  if (resultSignUp==massage)return;
//  resultSignUp=massage;
//  notifyListeners();
// }

}
