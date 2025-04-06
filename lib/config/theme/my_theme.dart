import 'package:flutter/material.dart';

class MyTheme
{
  static final ThemeData lightTheme =ThemeData
    (
    bottomNavigationBarTheme: BottomNavigationBarThemeData
      (

      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(
        size: 30
      ),
      unselectedItemColor: Colors.blue,
      showUnselectedLabels: true,
      elevation: 20

    )

  );
}