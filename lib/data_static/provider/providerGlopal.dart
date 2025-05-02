import 'package:flutter/material.dart';

class ProviderGlobal extends ChangeNotifier {
 int? indexTapBarCategories;
 String? idCategories;

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
}
