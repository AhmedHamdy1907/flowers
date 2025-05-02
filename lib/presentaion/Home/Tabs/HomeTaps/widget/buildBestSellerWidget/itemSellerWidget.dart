import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../core/routsManger/routs_manger.dart';

class ItemSellerWidget extends StatelessWidget {
  final String image;
  final String text;
  final num price;
  String? id;

  ItemSellerWidget({
    super.key,
    required this.id,
    required this.image,
    required this.text,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManger.productDetails, arguments: id);
      },
      child: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 4),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
            borderRadius: BorderRadius.circular(12.r),
          ),
          width: 130.w,
          height: 220.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 130.h,
                width: 130.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        color: Colors.grey[300],
                      ),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                text,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                "$price EGP",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12.sp,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
