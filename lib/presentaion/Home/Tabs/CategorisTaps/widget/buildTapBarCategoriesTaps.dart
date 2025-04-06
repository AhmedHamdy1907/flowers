import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuildTapBarCategoriesTaps extends StatelessWidget {
  const BuildTapBarCategoriesTaps({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tittle = [
      "Wedding",
      "Graduation",
      "Birthday",
      "Katb Ketab",
      "Graduation",
      "Graduation",
      "Graduation",
      "Graduation",
      "Graduation",
      "Graduation",
      "Graduation",
      "Graduation",
    ];
    return DefaultTabController(
      length: tittle.length,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TabBar(
          onTap: (index) {
            print("Selected index: $index");
          },
          unselectedLabelColor: Colors.black38,
          labelColor: Colors.pink,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
          dividerColor: Colors.transparent,
          indicatorColor: Colors.pink,
          isScrollable: true,
          tabs:
              tittle.map((title) {
                return Text(title);
              }).toList(),
        ),
      ),
    );

    // خليت البودي فاضي عشان الكود يشتغل من غير تعديل
  }
}
