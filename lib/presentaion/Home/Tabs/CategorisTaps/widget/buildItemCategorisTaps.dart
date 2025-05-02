import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/ColorsManger/ColorsManger.dart';
import '../../../../../core/routsManger/routs_manger.dart';
import '../../../../../data_static/provider/providerGlopal.dart';
import '../view_model/productsViewModelByCategories.dart';
import '../view_model/categoryViewModel.dart';
import 'build_shimmer_itemCategoriesTaps.dart';

class BuildItemCategoriesTaps extends StatelessWidget {
  const BuildItemCategoriesTaps({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = screenWidth > 500 ? 3 : 2;
    return Consumer<ProductsViewModelByCategories>(
      builder: (context, viewModel, _)
      {
        if (viewModel.isLoading && !viewModel.noData) {
          return BuildShimmerItemCategoriesTaps(crossAxisCount: crossAxisCount,);
        }
        else if (viewModel.errorMessage.isNotEmpty) {
          return Center(
            child: Text(
              viewModel.errorMessage,
              style: TextStyle(color: Colors.red, fontSize: 18.sp),
            ),
          );
        }
        else if (viewModel.noData) {
          return const Center(child: Text("No Data Found"));
        }
        return Provider.of<CategoryViewModel>(context).categories?.isNotEmpty==true?
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 10,
              mainAxisSpacing: 16,
              childAspectRatio: 0.6,
            ),
            itemCount: viewModel.products?.length ?? 0,
            itemBuilder: (context, index) {
              final product = viewModel.products![index];
              final discountRate = (((product.price! - product.priceAfterDiscount!) /
                  product.price!) *
                  100)
                  .toInt()
                  .toString();

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RoutesManger.productDetails,
                      arguments: product.id);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.black38),
                    ),
                    width: 190.w,
                    height: 266.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 131.h,
                              autoPlay: false,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                            ),
                            items: product.images?.map((imgPath) {
                              return
                                CachedNetworkImage(
                                  imageUrl: imgPath,
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
                                );
                            }).toList() ??
                                [],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            product.title ?? "",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "EGP ${product.priceAfterDiscount}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "${product.price}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black38,
                                ),
                              ),
                              const SizedBox(width: 8),
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
                          const SizedBox(height: 8),
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
            },
          ),
        ):BuildShimmerItemCategoriesTaps(crossAxisCount: crossAxisCount,);
      },
    );
  }
}
