import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class BuildPageView extends StatefulWidget {
  final List<String>? imagePageView;

  const BuildPageView({super.key, required this.imagePageView});

  @override
  State<BuildPageView> createState() => _BuildPageViewState();
}

class _BuildPageViewState extends State<BuildPageView> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: 450.h,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            itemCount: widget.imagePageView?.length ?? 0,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: widget.imagePageView![index],
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    height: 450.h,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                ),
                errorWidget: (context, url, error) =>
                    Icon(Icons.error, color: Colors.red),
              );
            },
          ),
          if ((widget.imagePageView?.length ?? 0) > 1)
            Positioned(
              bottom: 5,
              child: SmoothPageIndicator(
                controller: pageController,
                count: widget.imagePageView!.length,
                effect: CustomizableEffect(
                  dotDecoration: DotDecoration(
                    width: 10.w,
                    height: 10.h,
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  activeDotDecoration: DotDecoration(
                    width: 10.w,
                    height: 10.h,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          Positioned(
            top: 10,
            left: 10,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
