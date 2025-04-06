import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/biuildOccasion/Occasion.dart';
import '../widget/buildBestSeller/bestSeller.dart';
import '../widget/buildCategoris/Categories.dart';
import '../widget/buildSearch/buildSearch.dart';
import '../widget/buildLocation/buildlocation.dart';

class HomeTaps extends StatelessWidget {
  const HomeTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            Categories(),
            Bestseller(),
            Occasion()
          ],
        ),
      ),
    );
  }
}
