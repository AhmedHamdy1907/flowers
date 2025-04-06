import 'package:flower/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'Tabs/CartTaps/view/cartsTaps.dart';
import 'Tabs/CategorisTaps/view/categorisTaps.dart';
import 'Tabs/HomeTaps/view/homeTaps.dart';
import 'Tabs/profileTaps/view/profiletaps.dart';

class Home extends StatefulWidget {
   Home({super.key});

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  int selectedIndex  =0;
  @override
  Widget build(BuildContext context) {
    List<Widget>taps= [
      HomeTaps(),
      CategoriesTaps(),
      CartsTaps(),
      ProfileTaps(),
    ];
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
          onTap: (index) {
            selectedIndex=index;
            setState(() {});
          },
            currentIndex: selectedIndex,
            items:
            [
             BottomNavigationBarItem(
                 icon: Icon(Icons.home),
               label: AppLocalizations.of(context).home
             ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                label: AppLocalizations.of(context).categories
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                label: AppLocalizations.of(context).card
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                label: AppLocalizations.of(context).profile
              )

            ]
        ),
        body: taps[selectedIndex],
      ),
    );
  }
}
