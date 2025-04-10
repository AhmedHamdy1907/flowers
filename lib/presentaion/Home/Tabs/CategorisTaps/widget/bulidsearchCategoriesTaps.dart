import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../l10n/app_localizations.dart';
import 'buildFilter.dart';

class BuildSearchCategoriesTaps extends StatelessWidget {
  const BuildSearchCategoriesTaps({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Row(
      children: [
        SizedBox(width: 17.w),
        Expanded(
          // هنا بنستخدم Expanded
          child: SizedBox(
            height: 36.h,
            child: TextField(
              controller: searchController,
              onChanged: (v) {
                print(v);
              },
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: AppLocalizations.of(context).search,
                hintStyle: TextStyle(),
                contentPadding: REdgeInsets.symmetric(
                  vertical: 4.h, // زيادة padding عمودي لزيادة ارتفاع الـ TextField
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
        BuildFilter(),
        SizedBox(width: 16.w),
      ],
    );
  }
}
