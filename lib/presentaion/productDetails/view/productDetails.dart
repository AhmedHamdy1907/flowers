import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/ColorsManger/ColorsManger.dart';
import '../ViewModel/ProductsViewModelByID.dart';
import '../widget/buildTextDiscription.dart';
import '../widget/buildPageView.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsViewModelByID productsViewModel = ProductsViewModelByID();
  String? id;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
      id = ModalRoute.of(context)?.settings.arguments as String?;
      if (id != null) {
        productsViewModel.getProductsByID(id: id);
      }

  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: productsViewModel,
      child: SafeArea(
        child: Scaffold(
          body: Consumer<ProductsViewModelByID>(
            builder: (context, product, child) {
              if (product.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (product.errorMassage?.isNotEmpty??false) {
                return Center(
                  child: Text(
                    product.errorMassage ?? "Unexpected error",
                    style: TextStyle(color: Colors.red, fontSize: 18.sp),
                  ),
                );
              }

              if (product.products == null) {
                return const Center(
                  child: Text("No product data found"),
                );
              }

              return Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildPageView(imagePageView: product.products?.images),
                            SizedBox(height: 10.h),
                            BuildTextDescription(productSpecific: product.products),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add to cart logic
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(250.w, 50.h),
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
                            const Icon(Icons.shopping_cart),
                            SizedBox(width: 8.w),
                            Text(
                              "Add to cart",
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
