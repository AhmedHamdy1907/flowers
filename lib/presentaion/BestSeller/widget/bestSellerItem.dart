import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flower/core/assets_Manger/assetsManger.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routsManger/routs_manger.dart';

class BestSellerItem extends StatelessWidget {
  String nameProduct;
  String price;
  String priceBeforeDiscount;
  String discountRate;
   BestSellerItem({super.key,required this.price,required this.discountRate,required this.nameProduct ,required this.priceBeforeDiscount});
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap:
            ()
        {
          Navigator.pushNamed(context, RoutesManger.productDetails);
        },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                  color: Colors.black38
                )
          ),
          width: 170.w,
          height: 266.h, // زيادة الطول هنا
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AssetManger.testImage1,
                  width: double.infinity,
                  height: 131.h,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  nameProduct,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "EGP $price",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      priceBeforeDiscount,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "$discountRate%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: ()
                  {
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: ColorsManger.bink, // لون النص
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // تحديد زوايا الزر
                    ),
                    elevation: 5, // الظل
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart),
                      SizedBox(width: 8),
                      Text("Add to cart"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
