import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../../data_static/provider/providerGlopal.dart';
import '../view_model/categoryViewModel.dart';
import '../view_model/productsViewModelByCategories.dart';
import '../widget/buildItemCategorisTaps.dart';
import '../widget/buildTapBarCategoriesTaps.dart';
import '../widget/bulidsearchCategoriesTaps.dart';

class CategoriesTaps extends StatefulWidget {

   const CategoriesTaps({super.key});

  @override
  State<CategoriesTaps> createState() => CategoriesTapsState();
}

class CategoriesTapsState extends State<CategoriesTaps> {
  CategoryViewModel categoryViewModel=CategoryViewModel();
  ProductsViewModelByCategories productsViewModelByCategories=ProductsViewModelByCategories();
  @override
  void initState() {
    super.initState();
    categoryViewModel.getCategory();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var providerGlobal = Provider.of<ProviderGlobal>(context, listen: false);
      final categoryId = providerGlobal.idCategories;
      if (categoryId!=null)
        {
          productsViewModelByCategories.getProducts(id: categoryId);
          providerGlobal.changIdCategories(null);
        }
      else
        {
          productsViewModelByCategories.getProducts(id: null);
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers:
       [
         ChangeNotifierProvider.value(value: categoryViewModel),
         ChangeNotifierProvider.value(value: productsViewModelByCategories),
       ],
      builder: (context, child) => Column(
        children: [
          SizedBox(height: 15.h),
          BuildSearchCategoriesTaps(),
          SizedBox(height: 15.h),
          BuildTapBarCategoriesTaps(),
          SizedBox(height: 15.h),
          BuildItemCategoriesTaps(), // ده بياخد المنتجات من الـ Provider بتاعه
        ],
      ),

    );

  }
}
