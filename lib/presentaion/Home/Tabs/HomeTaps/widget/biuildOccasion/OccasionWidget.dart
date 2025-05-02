import 'package:flower/l10n/app_localizations.dart';
import 'package:flower/presentaion/Occasion/viewModel/occasion_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../core/routsManger/routs_manger.dart';
import 'itemOccasion.dart';

class OccasionWidget  extends StatelessWidget {
  const OccasionWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<OccasionViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).occasion,
                    style: TextStyleLight.bestseller,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManger.occasionScreen,
                        arguments: {
                          'occasionId': viewModel.occasions?.first.id,  // ده مثال
                        },
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context).viewAll,
                      style: TextStyleLight.viewAll,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 230.h,
                child: GridView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, // عدد الأعمدة
                    crossAxisSpacing: 10.w, // المسافة بين الأعمدة
                    mainAxisSpacing: 10.h, // المسافة بين الصفوف
                    childAspectRatio: 1.6, // نسبة العرض إلى الارتفاع لكل عنصر
                  ),
                  itemCount: 5,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Padding(
                      padding:  REdgeInsets.all(8.0),
                      child: Container(
                        width: 130.w,
                        height: 220.h,// نفس الأبعاد
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }



































        if (viewModel.errorMassage!.isNotEmpty) {
          return Center(
            child: Text(
              viewModel.errorMassage ?? "",
              style: TextStyle(color: Colors.red, fontSize: 18.sp),
            ),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).occasion,
                  style: TextStyleLight.bestseller,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManger.occasionScreen,
                      arguments: {
                        'occasionId': viewModel.occasions?.first.id,  // ده مثال
                      },
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context).viewAll,
                    style: TextStyleLight.viewAll,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 230.h,  // نفس الارتفاع هنا
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics:  BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, // عدد الأعمدة
                  crossAxisSpacing: 10.w, // المسافة بين الأعمدة
                  mainAxisSpacing: 10.h, // المسافة بين الصفوف
                  childAspectRatio: 1.6, // نسبة العرض إلى الارتفاع لكل عنصر
                ),
                itemCount: viewModel.occasions!.length,
                itemBuilder: (context, index) => ItemOcasion(
                  index: index,
                  id: viewModel.occasions?[index].id,
                  text: viewModel.occasions?[index].name ?? "",
                  image: viewModel.occasions?[index].image ?? "",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
