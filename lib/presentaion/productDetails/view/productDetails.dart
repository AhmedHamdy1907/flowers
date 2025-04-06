import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/ColorsManger/ColorsManger.dart';
import '../widget/buildTextDiscription.dart';
import '../widget/buildPageView.dart'; // إضافة المكتبة هنا

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // الصور التي ستعرض في الـ PageView

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding:  REdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildPageView(imagePageView: [],),
              SizedBox(height: 10.h,),
              BuildTextDescription(),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(250.w, 50.h), // تحديد العرض والارتفاع
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
              SizedBox(height: 10.h,)

              // عرض الصور باستخدام PageView.builder داخل الـ AppBar
            ],
          ),
        ),
      ),
    );
  }
}
