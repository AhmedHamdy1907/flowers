import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/TextStyel/TextStayel.dart';


class BuildLocation extends StatelessWidget {
  const BuildLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Icon(Icons.location_on_sharp,color: ColorsManger.black90,),
        SizedBox(width: 8.w,),
        Row(children: [
          Text("Deliver to ",style:TextStyleLight.deliverTo,),
          Text("2XVP+XC - Sheikh Zayed ",style:TextStyleLight.location ,),

        ],),
        Icon(Icons.arrow_drop_down_sharp,color: ColorsManger.bink,)
      ],
    );

  }
}
