import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildGenderOption extends StatelessWidget {
  final String title;
  final String? selectedGender;
  final Function(String) onSelect;

  const BuildGenderOption({
    super.key,
    required this.title,
    required this.selectedGender,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect(title);
      },
      child: Row(
        children: [
          Container(
            height: 25.h,
            width: 25.h,
            decoration: BoxDecoration(
              border: Border.all(width: 2.w, color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Padding(
              padding: REdgeInsets.all(3.5),
              child: Container(
                decoration: BoxDecoration(
                  color: selectedGender == title ? Colors.pinkAccent : Colors.transparent,
                  borderRadius: BorderRadius.circular(50.r),
                ),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            title,
            style: GoogleFonts.alatsi(fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
