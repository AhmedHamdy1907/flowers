import 'package:flower/core/assets_Manger/assetsManger.dart';
import 'package:flower/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/TextStyel/TextStayel.dart';
import '../../../../../../core/routsManger/routs_manger.dart';
import 'itemSeller.dart';

class Bestseller extends StatelessWidget {
  const Bestseller({super.key});

  @override
  Widget build(BuildContext context) {
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
              onTap: ()
              {
                Navigator.pushNamed(context, RoutesManger.bestSeller);
              },
              child: Text(
                AppLocalizations.of(context).viewAll,
                style: TextStyleLight.viewAll,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 190.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Itemseller(
                  text: "Sunny",
                  image: AssetManger.testImage1,
                  price: "700",
                ),
            itemCount: 20,
          ),
        ),
      ],
    );
  }
}
