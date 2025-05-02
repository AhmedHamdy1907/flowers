import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // ← استيراد الباكدج

import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../data_static/provider/providerGlopal.dart';
import '../../../../../../l10n/app_localizations.dart';
import '../../../../home.dart';
import '../../../CategorisTaps/view_model/categoryViewModel.dart';
import 'item.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderGlobal providerGlobal = Provider.of<ProviderGlobal>(context, listen: true);
    return Consumer<CategoryViewModel>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return Column(
            children: [
              Row(
                children: [
                  Text(
                    AppLocalizations.of(context).categories,
                    style: TextStyleLight.categories,
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      providerGlobal.indexTapBarCategories = 0;
                      final homeState = context.findAncestorStateOfType<HomeState>();
                      if (homeState != null) {
                        homeState.changeTab(1);
                      }
                    },
                    child: Text(
                      AppLocalizations.of(context).viewAll,
                      style: TextStyleLight.viewAll,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 30.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: REdgeInsets.symmetric(horizontal: 6),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          width: 80.w,
                          height: 30.h,
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          );
        } else if (value.errorMassage!.isNotEmpty) {
          return Text(value.errorMassage ?? "Error");
        } else if (value.noData) {
          return Text("No Found Data");
        }

        return Column(
          children: [
            Row(
              children: [
                Text(
                  AppLocalizations.of(context).categories,
                  style: TextStyleLight.categories,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    providerGlobal.indexTapBarCategories = 0;
                    final homeState = context.findAncestorStateOfType<HomeState>();
                    if (homeState != null) {
                      homeState.changeTab(1);
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context).viewAll,
                    style: TextStyleLight.viewAll,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 30.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.categories?.length ?? 0,
                itemBuilder: (context, index) {
                  return itemCategories(
                    index: index,
                    categoriesApi: value.categories![index],
                  );
                },
              ),
            ),
            SizedBox(height: 10.h),
          ],
        );
      },
    );
  }
}


