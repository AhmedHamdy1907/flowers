import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../viewModel/occasion_viewModel.dart';
import '../viewModel/productsViewModelByOccasion.dart';
import '../widget/buildOcccasionItem.dart';
import '../widget/buildTabBarOccasion.dart';

class OccasionScreen extends StatefulWidget {
  const OccasionScreen({super.key});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {
  OccasionViewModel occasionViewModel = OccasionViewModel();
  ProductsViewModelByOccasion productsViewModelByOccasion = ProductsViewModelByOccasion();
  int? index;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map<String?, dynamic>?;
    index = arguments?['index'];
    String? occasionId = arguments?['occasionId'];
      loadDataFromSpecificOccasion(occasionId??"");
  }
  Future<void> loadDataFromSpecificOccasion(String occasionId) async {
    occasionViewModel.getOccasion();
    productsViewModelByOccasion.getProducts(id: occasionId);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<BuildOcccasionItemState> productsKey = GlobalKey<BuildOcccasionItemState>();

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: AppBar(
            leadingWidth: 25,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Occasion",
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Bloom with our exquisite best sellers",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: occasionViewModel),
            ChangeNotifierProvider.value(value: productsViewModelByOccasion),
          ],
          child: Column(
            children: [
              SizedBox(height: 10.h),
              BuildTabBarOccasion(index: index, productsKey: productsKey),
              SizedBox(height: 8.h),
              Expanded(child: BuildOcccasionItem(productsViewModelByOccasion: productsViewModelByOccasion, key: productsKey)),
            ],
          ),
        ),
      ),
    );
  }
}


