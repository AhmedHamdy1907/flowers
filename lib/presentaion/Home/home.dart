import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data_static/provider/providerGlopal.dart';
import 'Tabs/CartTaps/view/cartsTaps.dart';
import 'Tabs/CategorisTaps/view/categorisTaps.dart';
import 'Tabs/HomeTaps/view/homeTaps.dart';
import 'Tabs/profileTaps/view/profiletaps.dart';
import 'package:flower/l10n/app_localizations.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int selectedIndex = 0;
  GlobalKey<HomeState> homeKey = GlobalKey<HomeState>();

  void changeTab(int index) {

    if (index!=1)
      {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Provider.of<ProviderGlobal>(context,listen: false).changeIndexTabBarCategories(0);
        });
      }

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> taps = [
      HomeTaps(myWidgetKey: homeKey),
      CategoriesTaps(),
      CartsTaps(),
      ProfileTaps(),
    ];

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) => changeTab(index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context).home,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: AppLocalizations.of(context).categories,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: AppLocalizations.of(context).card,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: AppLocalizations.of(context).profile,
            ),
          ],
        ),
        body: taps[selectedIndex],
      ),
    );
  }
}
