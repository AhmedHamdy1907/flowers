import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../../data/api/model/categories_Response/Categories.dart';
import '../../../../../../data_static/provider/providerGlopal.dart';
import '../../../../home.dart';

class itemCategories extends StatelessWidget {
  final CategoriesApi categoriesApi;
  final int index;

  const itemCategories({super.key, required this.categoriesApi, required this.index});

  @override
  Widget build(BuildContext context) {
    var providerGlobal = Provider.of<ProviderGlobal>(context);
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 6),
      child: InkWell(
        onTap: () {
          providerGlobal.changeIndexTabBarCategories(index + 1);
          providerGlobal.changIdCategories(categoriesApi.id);
          providerGlobal.changeSelectedTabs(1);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: Colors.grey.shade400),
          ),
          child: Text(
            textAlign: TextAlign.center,
            categoriesApi.name ?? "",
            style: GoogleFonts.cairo(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
