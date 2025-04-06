import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextDescription extends StatelessWidget {
  const BuildTextDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text("EGP 1,500",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 20.sp),) ,
            Spacer(),
            Row(
              children: [
                Text("Status:",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 16.sp),),
                Text(" In stock",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp),)
              ],
            )
          ],
        ),
        Text("All prices include tax",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 12.sp,color: Colors.black38),),
        Text("15 Pink Rose Bouquet",style: GoogleFonts.inter(fontWeight: FontWeight.w600,fontSize: 13.sp),),
        SizedBox(height: 8.h,),
        Text("Description",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 13.sp),),
        Text("Lorem ipsum dolor sit amet consectetur. Id sit morbi ornare morbi duis rhoncus orci massa."
          ,style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 10.sp),),
        Text("Bouquet include",style: GoogleFonts.inter(fontWeight: FontWeight.w500,fontSize: 13.sp,)),
        Text("Pink roses:15",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 10.sp),),
        Text("White wrap",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 10.sp),)

      ],
    );
  }
}
