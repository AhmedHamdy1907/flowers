import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/ColorsManger/ColorsManger.dart';
import '../../../../../../core/TextStyel/TextStayel.dart';


class itemCategoris extends StatelessWidget {
  String image;
  String text;
  VoidCallback function;

   itemCategoris({super.key,required this.function,required this.image,required this.text, });

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding:  REdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 8

      ),
      child: InkWell(
        onTap: function,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: ColorsManger.ofWhite,
                borderRadius: BorderRadius.circular(20.r),
              ),
              width: 68.w,
              height: 70.h,
              alignment: Alignment.center, // يضمن إن الصورة تكون في النص
              child: SizedBox(
                width: 30.w, // حجم أصغر للصورة
                height: 30.h,
                child: SvgPicture.asset(image),
              ),
            ),
            Text(text,style: TextStyleLight.textItemCategories,)

          ],
        ),
      ),
    );
  }
}
