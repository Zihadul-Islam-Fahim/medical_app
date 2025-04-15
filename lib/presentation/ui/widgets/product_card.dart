import 'package:medical_app/data/models/product_model.dart';
import 'package:medical_app/presentation/state_holders/wishlist_controller.dart';
import 'package:medical_app/presentation/ui/screen/product_details_screen.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final ProductModel productModel;
  bool? isWishProduct;

  ProductCard({super.key, required this.productModel, this.isWishProduct});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          () => ProductDetailScreen(
            productId: productModel.id!.toInt(),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
       // height: Get.height * 0.60,
        width: 130,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6)
              ),
             // color: Colors.white,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.circular(16),
              // ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: AspectRatio(
                      aspectRatio: 12 / 9,
                      child: Image.network(
                        "https://medblocks.appsowk.org/${productModel.image}" ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          productModel.title ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            overflow: TextOverflow.ellipsis,
                            fontFamily: 'mn',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '\€ ${productModel.price ?? ''}',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'mn',
                              ),
                            ),
                            // SizedBox(
                            //   width: Get.width * 0.01,
                            // ),
                             Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 13,
                                  color: Colors.amber,
                                ),
                                Text(
                                  productModel.star.toString(),
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black45,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Poppins',
                                  ),
                                )
                              ],
                            ),
                            // SizedBox(
                            //   width: Get.width * 0.017,
                            // ),
                            InkWell(
                              onTap: () async {
                                isWishProduct == true
                                    ? await Get.find<WishlistController>()
                                    .deleteFromWishList(productModel.id!.toInt())
                                    : await Get.find<WishlistController>()
                                    .addToWishList(productModel.id!.toInt(), context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: isWishProduct == true
                                    ? const Icon(
                                  Icons.delete,
                                  size: 26,
                                  color: AppColors.lightPrimaryColor,
                                )
                                    : const Icon(
                                  Icons.favorite,
                                  size: 26,
                                  color: AppColors.lightPrimaryColor,
                                ),
                              ),
                            )
                            
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
