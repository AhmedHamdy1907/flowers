import 'package:flower/core/routsManger/routs_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../core/assets_Manger/assetsManger.dart';
import '../../../../../../l10n/app_localizations.dart';
import 'itemOccasion.dart';

class Occasion extends StatelessWidget {
  const Occasion({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(AppLocalizations.of(context).occasion,style: TextStyleLight.occasion,),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesManger.occasionScreen);
              },
                child: Text(AppLocalizations.of(context).viewAll,style: TextStyleLight.viewAll,))
          ],
        ),
        SizedBox(
          height: 190.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ItemcOcasion(text: "Wedding",image: AssetManger.testImage1,price: "700",),
            itemCount: 20,
          ),
        )

      ],
    );
  }
}
