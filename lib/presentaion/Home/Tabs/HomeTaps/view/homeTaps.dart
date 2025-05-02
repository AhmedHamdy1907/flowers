import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../BestSeller/viewModel/bestSellerViewModel.dart';
import '../../../../Occasion/viewModel/occasion_viewModel.dart';
import '../../../home.dart';
import '../../CategorisTaps/view/categorisTaps.dart';
import '../../CategorisTaps/view_model/categoryViewModel.dart';
import '../../CategorisTaps/view_model/productsViewModelByCategories.dart';
import '../../CategorisTaps/widget/buildTapBarCategoriesTaps.dart';
import '../widget/biuildOccasion/OccasionWidget.dart';
import '../widget/buildBestSellerWidget/bestSellerWidget.dart';
import '../widget/buildCategoris/CategoriesWidget.dart';
import '../widget/buildSearch/buildSearch.dart';
import '../widget/buildLocation/buildlocation.dart';

class HomeTaps extends StatefulWidget {
  GlobalKey<HomeState> myWidgetKey ;
  HomeTaps({super.key,required this.myWidgetKey});

  @override
  State<HomeTaps> createState() => HomeTapsState();
}

class HomeTapsState extends State<HomeTaps> {
  // ProductsViewModelByCategories productsViewModelByCategories=ProductsViewModelByCategories();
  CategoryViewModel categoryViewModel=CategoryViewModel();
  BestSellerViewmodel bestSellerViewmodel=BestSellerViewmodel();
  OccasionViewModel occasionViewModel=OccasionViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryViewModel.getCategory();
    bestSellerViewmodel.getBestSeller();
    occasionViewModel.getOccasion();
    // productsViewModelByCategories.getProducts(id: null);
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: categoryViewModel) ,
        ChangeNotifierProvider.value(value: bestSellerViewmodel) ,
        ChangeNotifierProvider.value(value:occasionViewModel ),
        // ChangeNotifierProvider.value(value: productsViewModelByCategories),
      ],
      child: Padding(
        padding:  REdgeInsets.only( left:16 ,right: 16,top: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h,),
              BuildSearch(),
              SizedBox(height: 16.h,),
              BuildLocation(),
              SizedBox(height: 16.h,),
              CategoriesWidget(),
              SizedBox(height: 8.h,),
              BestsellerWidget(),
              SizedBox(height: 8.h,),
              OccasionWidget()
            ],
          ),
        ),
      ),
    );
  }
}
