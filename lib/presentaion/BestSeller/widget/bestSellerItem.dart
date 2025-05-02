import 'package:cached_network_image/cached_network_image.dart';
import 'package:flower/core/ColorsManger/ColorsManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../core/routsManger/routs_manger.dart';

class BestSellerItem extends StatelessWidget {
  final String? nameProduct;
  final String price;
  final String priceBeforeDiscount;
  final String discountRate;
  final String image;
  final String? id;

  const BestSellerItem({
    super.key,
    required this.id,
    required this.price,
    required this.discountRate,
    required this.nameProduct,
    required this.priceBeforeDiscount,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManger.productDetails,
        arguments: id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Colors.black38),
          ),
          width: 180.w,
          height: 266.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  height: 130.h,
                  width: double.infinity,
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: 130.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
                SizedBox(height: 8),
                Text(
                  nameProduct ?? "",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "EGP $price",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      priceBeforeDiscount,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.black38,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      "$discountRate%",
                      style: const TextStyle(
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
                    children: const [
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
}
