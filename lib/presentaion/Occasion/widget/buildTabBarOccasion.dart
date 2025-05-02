import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart'; // أضف السطر ده
import '../viewModel/occasion_viewModel.dart';
import 'buildOcccasionItem.dart';

class BuildTabBarOccasion extends StatelessWidget {
  final int? index;
  final GlobalKey<BuildOcccasionItemState> productsKey;
  const BuildTabBarOccasion({super.key, this.index, required this.productsKey});

  @override
  Widget build(BuildContext context) {
    return Consumer<OccasionViewModel>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 15, // عدد العناصر الشامرة اللي هتظهر وقت التحميل
              separatorBuilder: (_, __) => const SizedBox(width: 10),
              itemBuilder: (context, index) => Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          );
        }


        else if (value.errorMassage?.isNotEmpty ?? false) {
          return Center(
            child: Text(
              value.errorMassage ?? "Unknown error",
              style: const TextStyle(color: Colors.red),
            ),
          );
        }
        if (value.occasions == null || value.occasions!.isEmpty) {
          return const Center(child: Text("No occasions available."));
        }
        return DefaultTabController(
          initialIndex: index ?? 0,
          length: value.occasions!.length,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TabBar(
              onTap: (index) {
                var id = value.occasions?[index].id;
                productsKey.currentState?.updateID(id);
              },
              unselectedLabelColor: Colors.black38,
              labelColor: Colors.pink,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.symmetric(horizontal: 8),
              dividerColor: Colors.transparent,
              indicatorColor: Colors.pink,
              isScrollable: true,
              tabs: value.occasions!
                  .map((e) => Text(
                e.name ?? "",
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
