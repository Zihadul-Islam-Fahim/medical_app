import 'package:flutter/cupertino.dart';
import 'package:medical_app/data/models/cart_item.dart';
import 'package:medical_app/presentation/state_holders/cart_list_controller.dart';
import 'package:medical_app/presentation/ui/screen/product_details_screen.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:medical_app/presentation/ui/utility/utils.dart';

class CartProductItem extends StatefulWidget {
  const CartProductItem({super.key, required this.cartItem});

  final CartItem cartItem;

  @override
  State<CartProductItem> createState() => _CartProductItemState();
}

class _CartProductItemState extends State<CartProductItem> {
  late ValueNotifier<int> noOfCartItem =
      ValueNotifier(widget.cartItem.quantity);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetailScreen(productId: int.parse(widget.cartItem.productId!)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            // boxShadow: [BoxShadow(spreadRadius: 0.02,blurStyle: BlurStyle.outer),],
            borderRadius: BorderRadius.circular(16)),
        clipBehavior: Clip.hardEdge,
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                getImage(widget.cartItem.product!.image.toString()) ?? '',
                // width: 90,
                // height: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 6,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.cartItem.product?.title ?? '',
                              maxLines: 2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                                fontFamily: 'mn',
                              ),
                            ),
                            Text(
                              widget.cartItem.product!.shortDes ?? '',
                              maxLines: 3,

                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 9.5,
                                  fontFamily: 'mn',
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                              textConfirm: 'Delete',
                              textCancel: 'Cancel',
                              title: 'Delete',
                              middleText: 'Are you want to delete from cart?',
                              confirmTextColor: Colors.white,
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 16),
                              titleStyle: const TextStyle(
                                  fontFamily: 'mn',
                                  color: AppColors.primaryColor),
                              middleTextStyle:
                                  const TextStyle(fontFamily: 'mn'),
                              buttonColor: AppColors.primaryColor,
                              onConfirm: () async {
                                Get.back();
                                final response =
                                    await Get.find<CartListController>()
                                        .deleteFromCart(widget
                                            .cartItem.product!.id!
                                            .toInt());
                                if (response) {
                                  await Get.find<CartListController>()
                                      .getCartList();
                                } else {
                                  customToast(
                                      context, "Unable to delete from cart",
                                      isError: true);
                                }
                              },
                            );
                          },
                          icon: const Icon(
                            CupertinoIcons.delete,
                            color: AppColors.primaryColor,
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '€ ${widget.cartItem.product?.price}' ?? '0',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryColor,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: noOfCartItem,
                        builder: (context, value, _) {
                          return ItemCount(
                            initialValue: value,
                            minValue: 1,
                            maxValue: 10,
                            step: 1,
                            color: AppColors.primaryColor,
                            buttonSizeHeight: 25,
                            buttonSizeWidth: 30,
                            textStyle:
                                const TextStyle(fontFamily: 'mn', fontSize: 10),
                            onChanged: (v) {
                              noOfCartItem.value = v.toInt();
                              Get.find<CartListController>().updateQuantity(
                                  widget.cartItem.id!, noOfCartItem.value);
                            },
                            decimalPlaces: 0,
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
