import 'package:flower/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../core/routsManger/routs_manger.dart';
import '../../../../../BestSeller/viewModel/bestSellerViewModel.dart';
import 'itemSellerWidget.dart';

class BestsellerWidget extends StatelessWidget {
  const BestsellerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BestSellerViewmodel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).bestseller,
                    style: TextStyleLight.bestseller,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesManger.bestSeller, arguments: viewModel.bestSeller);
                    },
                    child: Text(
                      AppLocalizations.of(context).viewAll,
                      style: TextStyleLight.viewAll,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 230.h,  // تم زيادة الارتفاع هنا
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
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 130.h,
                        width: 130.w,
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


















        if (viewModel.errorMassage != null && viewModel.errorMassage!.isNotEmpty) {
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
                  AppLocalizations.of(context).bestseller,
                  style: TextStyleLight.bestseller,
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesManger.bestSeller, arguments: viewModel.bestSeller);
                  },
                  child: Text(
                    AppLocalizations.of(context).viewAll,
                    style: TextStyleLight.viewAll,
                  ),
                ),
              ],
            ),
            // زيادة الارتفاع هنا
            SizedBox(
              height: 230.h,  // تم زيادة الارتفاع هنا
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
                itemCount: viewModel.bestSeller?.length ?? 0,
                itemBuilder: (context, index) => ItemSellerWidget(
                  id: viewModel.bestSeller?[index].id ?? "",
                  text: viewModel.bestSeller?[index].title ?? "",
                  image: viewModel.bestSeller?[index].images?.first ?? "",
                  price: viewModel.bestSeller?[index].price ?? 0,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
