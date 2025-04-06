import 'package:flower/core/assets_Manger/assetsManger.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/TextStyel/TextStayel.dart' show TextStyleLight;
import '../../../../../../l10n/app_localizations.dart';
import 'item.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    List<String>image= [
      AssetManger.tulip,
      AssetManger.gift,
      AssetManger.card,
      AssetManger.jewellery,
    ];
    List<String>tittel=
    [
      AppLocalizations.of(context).flowery,
      AppLocalizations.of(context).gift,
      AppLocalizations.of(context).card,
      AppLocalizations.of(context).jewellery,
    ];
    return  Column(
      children: [
        Row(
          children: [
            Text(AppLocalizations.of(context).categories,style: TextStyleLight.categories,),
            Spacer(),
            Text(AppLocalizations.of(context).viewAll,style: TextStyleLight.viewAll,),
          ],
        ),
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => itemCategoris(image: image[index],text: tittel[index],function: (){print(index);}),
            itemCount: 4,
          ),
        )

      ],
    );
  }
}
