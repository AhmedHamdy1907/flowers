import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';


import '../widget/buildItemCategorisTaps.dart';
import '../widget/buildTapBarCategoriesTaps.dart';
import '../widget/bulidsearchCategoriesTaps.dart';

class CategoriesTaps extends StatelessWidget {
  const CategoriesTaps({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (screenWidth > 500) {
      crossAxisCount = 3;
    }
    return Column(
      children: [
        SizedBox(height: 15.h,),
        BuildSearchCategoriesTaps(),
        SizedBox(height: 15.h,),
        BuildTapBarCategoriesTaps(),
        SizedBox(height: 15.h,),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // عدد الأعمدة
              crossAxisSpacing: 10, // المسافة بين الأعمدة
              mainAxisSpacing: 16, // المسافة بين الصفوف
              childAspectRatio:
              0.6, // النسبة بين العرض والارتفاع (أقل من 1 يعني العناصر هتكون أطول)
            ),
            itemBuilder:
                (context, index) => BuildItemCategoriesTaps(
              price: "600",
              discountRate: "20",
              nameProduct: "Red roses",
              priceBeforeDiscount: "900",
            ),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}
