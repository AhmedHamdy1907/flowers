import 'package:flower/data/api/model/productsSpesefic_Response/Product_specific.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildTextDescription extends StatelessWidget {
  final ProductSpecificApi? productSpecific;

  const BuildTextDescription({required this.productSpecific, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "EGP ${productSpecific?.price?.toStringAsFixed(2) ?? 'N/A'}",
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  "Status: ",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  productSpecific?.quantity != null && productSpecific!.quantity! > 0 ? "In stock" : "Out of stock",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: productSpecific?.quantity != null && productSpecific!.quantity! > 0
                        ? Colors.green
                        : Colors.red,
                  ),
                )
              ],
            ),
          ],
        ),

        SizedBox(height: 5.h),

        // الضرائب
        Text(
          "All prices include tax",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
            color: Colors.black38,
          ),
        ),

        // عنوان المنتج
        if (productSpecific?.title != null)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.h),
            child: Text(
              productSpecific!.title!,
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
              ),
            ),
          ),
        SizedBox(height: 8.h),
        Text(
          "Description",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
        Text(
          productSpecific?.description ?? "No description available.",
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w400,
            fontSize: 14.sp,
          ),
        ),
        Text("Bouquet include",style: GoogleFonts.inter(fontWeight: FontWeight.w700,fontSize: 16.sp,)),
        Text("Pink roses:15",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp),),
        Text("White wrap",style: GoogleFonts.inter(fontWeight: FontWeight.w400,fontSize: 14.sp),)
      ],
    );
  }
}
