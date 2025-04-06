import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../ColorsManger/ColorsManger.dart';

class TextStyleLight {
  static TextStyle flowery = GoogleFonts.imFellEnglish (
    fontWeight: FontWeight.w400,
    fontSize: 15.sp,
    // fontFamily: "IMFellEnglish",
    color: ColorsManger.bink,
  );
  static TextStyle deliverTo = GoogleFonts.inter( // هنا استخدمنا خط Lobster
    fontSize: 14,
    color: ColorsManger.black90,
    fontWeight: FontWeight.w500

  );
  static TextStyle location = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 14,
      color: ColorsManger.black,
      fontWeight: FontWeight.w500

  );
  static TextStyle viewAll = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 12,
      color: ColorsManger.bink,
      fontWeight: FontWeight.w500

  );
  static TextStyle categories = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 18,
      color: ColorsManger.black,
      fontWeight: FontWeight.w500

  );
  static TextStyle bestseller = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 18,
      color: ColorsManger.black,
      fontWeight: FontWeight.w500

  );
  static TextStyle occasion = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 18,
      color: ColorsManger.black,
      fontWeight: FontWeight.w500

  );
  static TextStyle textItemCategories = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 14,
      color: ColorsManger.black,
      fontWeight: FontWeight.w400

  );
  static TextStyle bestDSeller = GoogleFonts.inter( // هنا استخدمنا خط Lobster
      fontSize: 14,
      color: ColorsManger.black,
      fontWeight: FontWeight.w400

  );



}