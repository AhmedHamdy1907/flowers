import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../config/theme/my_theme.dart';
import '../core/routsManger/routs_manger.dart';
import '../l10n/app_localizations.dart';
import '../presentaion/Home/home.dart';


class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        routes: RoutesManger.routs,
        initialRoute: RoutesManger.home,
        localizationsDelegates: [
          AppLocalizations.delegate, // Add this line
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en'), // English
          Locale('ar'), // Spanish
        ],
        locale: Locale('en'),
        debugShowCheckedModeBanner: false,
        theme:MyTheme.lightTheme ,
        themeMode:ThemeMode.light,
      ),
    );
  }
}
