import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../core/assets_Manger/assetsManger.dart';
import '../../../../../../l10n/app_localizations.dart';



class BuildSearch extends StatelessWidget {
  const BuildSearch({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController =TextEditingController();
    return Row(
      children: [
        SvgPicture.asset(AssetManger.flower, width: 20.w, height: 20.h),
        Text(
          AppLocalizations.of(context).flowery,
          style: TextStyleLight.flowery,
        ),
        SizedBox(width: 17.w),
        Expanded(  // هنا بنستخدم Expanded
          child: SizedBox(
            height: 36.h,
            child: TextField(
              controller: searchController,
              onChanged: (v) {
                print(v);
              },
              textAlign: TextAlign.start,  // يخلّي النص في المنتصف
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                prefixIcon: Icon(Icons.search),
                hintText: AppLocalizations.of(context).search,
                hintStyle: TextStyle(),
                contentPadding: REdgeInsets.symmetric(vertical:4.h), // يوسّط النص رأسيًا
              ),
            ),
          ),
        ),
        SizedBox(width: 16.w),
      ],
    );

  }
}
