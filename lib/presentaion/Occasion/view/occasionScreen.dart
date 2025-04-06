import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/buildOcccasionItem.dart';

class OccasionScreen extends StatelessWidget {
  const OccasionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    int crossAxisCount = 2;
    if (screenWidth > 500) {
      crossAxisCount = 3;
    }

    List<String> tittle = ["Wedding", "Graduation", "Birthday", "Katb Ketab","Graduation","Graduation","Graduation","Graduation","Graduation","Graduation","Graduation","Graduation",];

    return SafeArea(
      child: DefaultTabController(
        length: tittle.length,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: AppBar(
              leadingWidth: 25,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Occasion",
                    style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Bloom with our exquisite best sellers",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(50.h),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TabBar(
                    onTap: (index) {
                      print(index);
                    },
                    unselectedLabelStyle: TextStyle(color: Colors.black38),
                    labelStyle: TextStyle(color: ColorsManger.bink),
                    tabAlignment: TabAlignment.start,
                    labelPadding: REdgeInsets.all(8),
                    dividerColor: Colors.transparent,
                    indicatorColor: ColorsManger.bink,
                    isScrollable: true,
                    tabs: tittle.map((tittle) {
                      return Text(tittle,);
                    }).toList(),
                  ),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount, // عدد الأعمدة
                crossAxisSpacing: 10, // المسافة بين الأعمدة
                mainAxisSpacing: 16, // المسافة بين الصفوف
                childAspectRatio:
                0.6, // النسبة بين العرض والارتفاع (أقل من 1 يعني العناصر هتكون أطول)
              ),
              itemBuilder:
                  (context, index) => BuildOcccasionItem(
                price: "600",
                discountRate: "20",
                nameProduct: "Red roses",
                priceBeforeDiscount: "900",
              ),
              itemCount: 10,
            ),
          ), // خليت البودي فاضي عشان الكود يشتغل من غير تعديل
        ),
      ),
    );
  }
}
