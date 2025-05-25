import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data_static/provider/providerGlopal.dart';
import 'Tabs/CartTaps/view/cartsTaps.dart';
import 'Tabs/CategorisTaps/view/categorisTaps.dart';
import 'Tabs/HomeTaps/view/homeTaps.dart';
import 'Tabs/profileTaps/view/profiletaps.dart';
import 'package:flower/l10n/app_localizations.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var providerGlobal = Provider.of<ProviderGlobal>(context);
    List<Widget> taps = [
      HomeTaps(),
      CategoriesTaps(),
      CartsTaps(),
      ProfileTaps(),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: providerGlobal.selectedTabs ?? 0,
          onTap: (index) {
            providerGlobal.changeSelectedTabs(index);
            providerGlobal.changeIndexTabBarCategories(0);
          },
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
        body: taps[providerGlobal.selectedTabs ?? 0],
      ),
    );
  }
}
