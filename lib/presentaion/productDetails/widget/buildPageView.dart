import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/assets_Manger/assetsManger.dart';

class BuildPageView extends StatefulWidget {
   List<String>?imagePageView;

    BuildPageView({super.key,required this.imagePageView});

  @override
  State<BuildPageView> createState() => _BuildPageViewState();
}

class _BuildPageViewState extends State<BuildPageView> {
  List<String> images = [
    AssetManger.testImage5,
    AssetManger.testImage5,
    AssetManger.testImage5,
    AssetManger.testImage5,
  ];
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0); // الصفحة الأولى عند بدء العرض
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      // margin: EdgeInsets.symmetric(horizontal: 15),
      height: 450.h, // تحديد الارتفاع
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: images.length, // عدد الصور
            itemBuilder: (context, index) {
              // بناء كل عنصر داخل الـ PageView
              return Image.asset(
                images[index], // تحميل الصورة من القائمة
                fit: BoxFit.fill, // ملء المساحة بشكل كامل
              );
            },
          ),
          Positioned(
            bottom: 5,
            child: SmoothPageIndicator(
              controller: pageController, // التحكم بالنقاط
              count: images.length, // عدد النقاط بحسب عدد الصور
              effect: CustomizableEffect( // تأثير النقاط القابلة للتخصيص
                dotDecoration: DotDecoration(
                  width: 10.w, // عرض النقطة
                  height: 10.h, // ارتفاع النقطة
                  color: Colors.black38, // لون النقطة الغير نشطة
                  borderRadius: BorderRadius.circular(50), // جعل النقطة دائرة تمامًا
                ),
                activeDotDecoration: DotDecoration(
                  width: 10.w, // عرض النقطة النشطة
                  height: 10.h, // ارتفاع النقطة النشطة
                  color: Colors.blue, // لون النقطة النشطة
                  borderRadius: BorderRadius.circular(50), // جعل النقطة النشطة دائرة تمامًا
                ),
              ),
            ),
          ),
          // إضافة زر العودة في أعلى يسار الشاشة
          Positioned(
            top: 10,
            left: 10,
            child: InkWell(
              onTap: () {
                // من هنا يمكنك إضافة الكود للعودة للشاشة السابقة
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25.sp,// يمكنك تغيير اللون حسب الحاجة
              ),
            ),
          ),
        ],
      ),
    );
  }
}
