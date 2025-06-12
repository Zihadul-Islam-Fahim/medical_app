import 'package:flutter/widgets.dart';
import 'package:medical_app/data/models/product_details_data.dart';
import 'package:medical_app/presentation/state_holders/add_to_cart_controller.dart';
import 'package:medical_app/presentation/state_holders/auth_controller.dart';
import 'package:medical_app/presentation/state_holders/product_details_controller.dart';
import 'package:medical_app/presentation/ui/screen/auth/verify_email_screen.dart';
import 'package:medical_app/presentation/ui/utility/app_colors.dart';
import 'package:medical_app/presentation/ui/utility/utils.dart';
import 'package:medical_app/presentation/ui/widgets/circular_progress_indicator.dart';
import 'package:medical_app/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:medical_app/presentation/ui/widgets/product_details/review_and_rating.dart';
import 'package:medical_app/presentation/ui/widgets/shimmer_effect/shimmer_product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailScreen extends StatefulWidget {
  final int productId;

  const ProductDetailScreen({super.key, required this.productId});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ValueNotifier<int> noOfCartItem = ValueNotifier(1);

  String? _selectedColor ="Red";

  String? _selectedSize="X";

  @override
  void initState() {
    Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Product Details',
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),

        // leading: IconButton(
        //   onPressed: () {
        //     Get.back();
        //   },
        //   icon: const Icon(
        //     Icons.arrow_back_ios,
        //     color: Colors.grey,
        //   ),
        // ),
      ),
      body: GetBuilder<ProductDetailsController>(builder: (controller) {
        final data = controller.productDetailsModel.data;

        if (controller.inProgress) {
          return SimmerProductDetails();
        } else if (data!.isEmpty ) {
          return const Center(
            child: Text('Didn\'t get data'),
          );
        }
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProductImageCarouselWidget(height: Get.height * 0.3, urls: [
                      getImage(controller.productDetailsData.product!.image!) ?? '',
                      getImage(controller.productDetailsData.product!.image!) ?? '',
                      getImage(controller.productDetailsData.product!.image!) ?? '',

                    ]),
                    productDetailsBody(controller.productDetailsData),
                  ],
                ),
              ),
            ),
            priceAndCartSection(
                controller.productDetailsData.product?.price ?? '0'),
          ],
        );
      }),
    );
  }

  Padding productDetailsBody(ProductDetailsDataModel productDetails) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'mn',
                  ),
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
                    buttonSizeWidth: 35,

                    textStyle: const TextStyle( fontFamily: 'mn',),
                    onChanged: (v) {
                      noOfCartItem.value = v.toInt();
                    },
                    decimalPlaces: 0,
                  );
                },
              )
            ],
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          reviewAndRatingRow(double.parse(productDetails.product?.star ?? "0"),
              int.parse(productDetails.productId ?? "1"),context),
          SizedBox(
            height: Get.height * 0.01,
          ),
          // const Text(
          //   'Color',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //     fontFamily: 'Poppins',
          //   ),
          // ),
          // ColorSelector(
          //   productColors: productDetails.color
          //           ?.split(',')
          //           .map((e) => getColorFromString(e))
          //           .toList() ??
          //       [],
          //   onChange: (selectedColor) {
          //     _selectedColor = selectedColor.toString();
          //   },
          // ),
          // SizedBox(
          //   height: Get.height * 0.015,
          // ),
          // const Text(
          //   'Size',
          //   style: TextStyle(
          //     fontSize: 18,
          //     fontWeight: FontWeight.w500,
          //     fontFamily: 'Poppins',
          //   ),
          // ),
          // SizeSelector(
          //     sizes: productDetails.size?.split(',') ?? [],
          //     onChange: (s) {
          //       _selectedSize = s;
          //     }),
          SizedBox(
            height: Get.height * 0.015,
          ),
          const Text(
            'Description',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              fontFamily: 'mn',
            ),
          ),
          SizedBox(
            height: Get.height * 0.01,
          ),
          Text(
            productDetails.product!.shortDes!,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontFamily: 'mn',
            ),
          )
        ],
      ),
    );
  }

  Container priceAndCartSection(String price) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.15),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'mn',
                  color: Colors.black45,
                ),
              ),
              Text(
               "€ "+ price.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
          SizedBox(width: 10,),
          Expanded(
           // width: Get.width * 0.29,
            child: GetBuilder<AddToCartController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: const CenterCircularProgressIndicator(),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_selectedColor != null && _selectedSize != null) {
                      if (Get.find<AuthController>().isTokenNotNull) {
                        final bool response = await controller.addToCart(
                            widget.productId,
                            colorToString(_selectedColor!),
                            _selectedSize!,
                            noOfCartItem.value);
                        if (response) {
                          customToast(context, "Item added to cart");


                        } else {
                          customToast(context, 'Failed to cart',isError: true);
                        }
                      } else {
                        Get.to(() => const VerifyEmailScreen());
                      }
                    } else {
                      customToast(context, 'Failed to cart',isError: true);
                    }
                  },
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'mn',
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }

  Color getColorFromString(String colorCode) {
    String code = colorCode.toLowerCase();
    if (code == 'red') {
      return Colors.red;
    }
    if (code == 'black') {
      return Colors.black;
    }
    if (code == 'green') {
      return Colors.green;
    }
    if (code == 'blue') {
      return Colors.blue;
    } else {
      return Colors.white;
    }
  }

  String colorToString(String colorCode) {
    String code = colorCode;
    if (code == 'MaterialColor(primary value: Color(0xff4caf50))') {
      return 'Green';
    }
    if (code == 'MaterialColor(primary value: Color(0xfff44336))') {
      return 'Red';
    } else {
      return 'White';
    }
  }
}
