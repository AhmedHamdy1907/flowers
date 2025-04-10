import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildFilter extends StatefulWidget {
  const BuildFilter({super.key});

  @override
  State<BuildFilter> createState() => _BuildFilterState();
}

class _BuildFilterState extends State<BuildFilter> {
  Map<String, bool> filter = {
    "Lowest Price": false,
    "Highest Price": false,
    "New": false,
    "Old": false,
    "Discount": false,
  };
  double minPrice = 0;
  double maxPrice = 250;
  double currentPrice = 0;
  List<String> filterApi = [];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showCustomModalBottomSheet(context: context);
      },
      child: Container(
        width: 40.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.black54),
        ),
        child: const Icon(Icons.filter_list_outlined, size: 40),
      ),
    );
  }

  void showCustomModalBottomSheet({required BuildContext context}) {
    showModalBottomSheet(
      isScrollControlled: true,  // تأكد من أن الموديل قابل للتمدد
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              height: 575.h,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: ColorsManger.bink,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        height: 4.h,
                        width: 80.w,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Filter",
                      style: GoogleFonts.outfit(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorsManger.bink,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    // Ensure that ListView is shrinkable and takes up necessary space
                    ListView.builder(
                      shrinkWrap: true, // Ensures ListView takes only the space it needs
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filter.keys.length,
                      itemBuilder: (context, index) {
                        String tittle = filter.keys.elementAt(index);
                        return buildItemFilter(
                          tittle: tittle,
                          setModalState: setModalState,
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      "Price: \$${currentPrice.toInt()}",
                      style: GoogleFonts.outfit(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: ColorsManger.bink,
                        inactiveTrackColor: Colors.grey[200],
                        thumbColor: Colors.white,
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 12.r,
                          elevation: 4,
                        ),
                        overlayColor: ColorsManger.bink.withOpacity(0.2),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 20.r,
                        ),
                        trackHeight: 4.h,
                        valueIndicatorShape:
                        PaddleSliderValueIndicatorShape(),
                        valueIndicatorColor: ColorsManger.bink,
                        valueIndicatorTextStyle: GoogleFonts.outfit(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        showValueIndicator: ShowValueIndicator.always,
                      ),
                      child: Slider(
                        min: minPrice,
                        max: maxPrice,
                        value: currentPrice,
                        onChanged: (value) {
                          setModalState(() {
                            currentPrice = value;
                          });
                        },
                        divisions: (maxPrice - minPrice).toInt(),
                        label: '\$${currentPrice.toInt()}',
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                              side: BorderSide(color: ColorsManger.bink),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'Cancel',
                              style: GoogleFonts.outfit(
                                color: ColorsManger.bink,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsManger.bink,
                              padding: EdgeInsets.symmetric(vertical: 16.h),
                            ),
                            onPressed: () {
                              Navigator.pop(context, {});
                            },
                            child: Text(
                              'Apply',
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h,)
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget buildItemFilter({
    required String tittle,
    required void Function(void Function()) setModalState,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.h),
      height: 50.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            Text(tittle, style: const TextStyle(fontWeight: FontWeight.w700)),
            const Spacer(),
            InkWell(
              onTap: () {
                setModalState(() {
                  filter[tittle] = !(filter[tittle] ?? false);

                  if (filter[tittle]! && !filterApi.contains(tittle)) {
                    filterApi.add(tittle);
                  } else {
                    filterApi.remove(tittle);
                  }

                  print("Current filterApi: $filterApi");
                  print("Current price: $currentPrice");
                });
              },
              child: Container(
                height: 25.h,
                width: 20.w,
                decoration: BoxDecoration(
                  color:
                      filter[tittle]! ? ColorsManger.bink : Colors.transparent,
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
