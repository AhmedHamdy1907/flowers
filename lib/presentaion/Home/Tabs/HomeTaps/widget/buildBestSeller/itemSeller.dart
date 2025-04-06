import 'package:flower/core/routsManger/routs_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/assets_Manger/assetsManger.dart';


class Itemseller extends StatelessWidget {
  String image;
  String text;
  String price;


   Itemseller({super.key,required this.image,required this.text,required this.price,});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManger.productDetails);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.h,
              // width: 150.w,
              child:Image.asset(AssetManger.testImage1),
            ),
            Text(text,textAlign: TextAlign.start,),
            Text("$price EGP",textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.w700
            ),)
          ],
        ),
      ),
    );
  }
}
