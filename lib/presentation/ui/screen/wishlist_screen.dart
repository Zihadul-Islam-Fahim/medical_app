import 'package:medical_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:medical_app/presentation/state_holders/wishlist_controller.dart';
import 'package:medical_app/presentation/ui/widgets/product_card.dart';
import 'package:medical_app/presentation/ui/widgets/shimmer_effect/shimmer_product_list_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<WishlistController>().getWishList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Get.find<BottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            'Wishlist',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GetBuilder<WishlistController>(builder: (controller) {
            if (controller.inProgress) {
              return const ShimmerProductListGridView();
            }
            return controller.wishlistProductModel.data?.length==0 ?const Center(
            child: Text(
            "No Product in wishlist",
            style: TextStyle(fontFamily: 'mn'),
            ),
            ): GridView.builder(
              itemCount: controller.wishlistProductModel.data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                mainAxisSpacing: 8,
                crossAxisSpacing: 6
              ),
              itemBuilder: (context, index) {
                return ProductCard(
                  productModel:
                      controller.wishlistProductModel.data![index].product!,
                  isWishProduct: true,
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
