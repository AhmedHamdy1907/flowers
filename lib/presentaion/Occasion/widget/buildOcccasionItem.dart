import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/routsManger/routs_manger.dart';
import '../viewModel/occasion_viewModel.dart';
import '../viewModel/productsViewModelByOccasion.dart';
import 'build_shimmer_itemOccasion.dart';

class BuildOcccasionItem extends StatefulWidget {
  ProductsViewModelByOccasion productsViewModelByOccasion;
  BuildOcccasionItem({super.key, required this.productsViewModelByOccasion});

  @override
  State<BuildOcccasionItem> createState() => BuildOcccasionItemState();
}

class BuildOcccasionItemState extends State<BuildOcccasionItem> {
  String? id;
  void updateID(String? updateId) {
    id = updateId;
    if (id != null) {
      Provider.of<ProductsViewModelByOccasion>(context, listen: false)
          .getProducts(id: id);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 500 ? 3 : 2;

    return Provider.of<OccasionViewModel>(context).occasions?.isNotEmpty == true
        ? Consumer<ProductsViewModelByOccasion>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return BuildShimmerItemOccasion(crossAxisCount: crossAxisCount);
        }
        else if (value.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              value.errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 18.sp),
            ),
          );
        } else if (value.noData) {
          return const Center(child: Text("No Data Found"));
        } else if (value.products?.isEmpty ?? true) {
          return const SizedBox(); // مش هيعرض أي حاجة لو الـ products فاضية
        }

        return GridView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 16,
            childAspectRatio: 0.6,
          ),
          itemCount: value.products?.length ?? 0,
          itemBuilder: (context, index) {
            final product = value.products![index];
            num? discountRate = ((product.price! - product.priceAfterDiscount!) /
                product.price! *
                100)
                .round();
            return buildItem(
              context: context,
              id: product.id ?? "",
              nameProduct: product.title,
              imageUrl: product.imgCover,
              price: product.price.toString(),
              priceBeforeDiscount: product.priceAfterDiscount.toString(),
              discountRate: discountRate,
            );
          },
        );
      },
    ):  BuildShimmerItemOccasion(crossAxisCount: crossAxisCount);
  }
}




Widget buildItem({
  required String id,
  required BuildContext context,
  required String? nameProduct,
  required String? imageUrl,
  required String? price,
  required String? priceBeforeDiscount,
  required num? discountRate,
}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, RoutesManger.productDetails, arguments: id);
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.black38),
        ),
        width: 170.w,
        height: 266.h,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl ?? '',
                width: double.infinity,
                height: 131.h,
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 131.h,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              SizedBox(height: 8),
              Text(
                nameProduct ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "EGP $price",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    priceBeforeDiscount ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "$discountRate%",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: ColorsManger.bink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart),
                    SizedBox(width: 8),
                    Text("Add to cart"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
