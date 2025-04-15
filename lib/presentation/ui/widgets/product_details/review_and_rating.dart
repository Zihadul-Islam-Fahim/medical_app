

import 'package:medical_app/presentation/state_holders/wishlist_controller.dart';
import 'package:medical_app/presentation/ui/screen/review_screen.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row reviewAndRatingRow(double rating, int productId,BuildContext context) {
  return Row(
    children: [
       Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(
            Icons.star,
            size: 19,
            color: Colors.amber,
          ),
          Text(
            rating.toString(),
            style: TextStyle(
              fontSize: 16,
              color: Colors.black45,
              fontWeight: FontWeight.w600,
              fontFamily: 'mn',
            ),
          )
        ],
      ),
      SizedBox(
        width: Get.width * 0.02,
      ),
      GestureDetector(
        onTap: () {
          Get.to(() => ReviewScreen(
                productId: productId,
              ));
        },
        child: const Text(
          'Reviews',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w800,
            letterSpacing: 0.7,
            fontFamily: 'mn',
          ),
        ),
      ),
      SizedBox(width: 7,),
      InkWell(
        onTap: () async {
          final bool result =
              await Get.find<WishlistController>().addToWishList(productId,context);

        },
        child: Padding(
          padding: EdgeInsets.all(4.0),
          child: Icon(
            Icons.favorite,
            size: 28,
            color: AppColors.lightPrimaryColor,
          ),
        ),
      )
    ],
  );
}
