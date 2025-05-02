import 'package:flutter/material.dart';
import '../../../core/TextStyel/TextStayel.dart';
import '../../../data/api/model/best_seller_Response/BestSeller.dart';
import '../widget/bestSellerItem.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<BestSellerApi>? bestSeller= ModalRoute.of(context)?.settings.arguments as List<BestSellerApi>?;
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = 2;
    if (screenWidth > 500) {
      crossAxisCount = 3;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 25,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Best Seller", style: TextStyleLight.bestseller),
              Text(
                "Bloom with our exquisite best sellers",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: GridView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // عدد الأعمدة
              crossAxisSpacing: 10, // المسافة بين الأعمدة
              mainAxisSpacing: 16, // المسافة بين الصفوف
              childAspectRatio:
                  0.6, // النسبة بين العرض والارتفاع (أقل من 1 يعني العناصر هتكون أطول)
            ),
            itemBuilder:
                (context, index) => BestSellerItem(
                  id: bestSeller[index].id,
                  image:bestSeller[index].images!.first,
                  price:bestSeller[index].price.toString(),
                  discountRate: bestSeller[index].discount.toString(),
                  nameProduct: bestSeller[index].title,
                  priceBeforeDiscount: bestSeller[index].priceAfterDiscount.toString(),
                ),
            itemCount: bestSeller!.length,
          ),
        ),
      ),
    );
  }
}
