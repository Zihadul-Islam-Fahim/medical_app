
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCategoryGridView extends StatelessWidget {
  const ShimmerCategoryGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 0.95,
        mainAxisSpacing: 14,
        crossAxisSpacing: 12
      ),
      itemCount: 16, // Number of grid items
      itemBuilder: (BuildContext context, int index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            // elevation: 3,
            child: Container(
              height: 40,
              width: 85,
              color: Colors.grey[300]!,
            ),
          ),
        );
      },
    );
  }
}