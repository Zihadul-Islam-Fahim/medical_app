import 'package:medical_app/data/models/product_list_model.dart';
import 'package:medical_app/presentation/state_holders/product_controller.dart';
import 'package:medical_app/presentation/ui/widgets/product_card.dart';
import 'package:medical_app/presentation/ui/widgets/shimmer_effect/shimmer_grid_view.dart';
import 'package:medical_app/presentation/ui/widgets/shimmer_effect/shimmer_product_list_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatefulWidget {
  final String? category;
  final int? categoryId;
  final int? brandId;
  final ProductListModel? productListModel;

  const ProductListScreen({
    super.key,
    this.category,
    this.productListModel,
    this.categoryId,
    this.brandId,
  });

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  bool isCategory = false;

  @override
  void initState() {
    if (widget.categoryId != null || widget.brandId != null) {
      if (widget.categoryId != null) {
        Get.find<ProductController>()
            .getProductListByCategory(categoryId: widget.categoryId!);
        isCategory = true;
      } else {
        Get.find<ProductController>()
            .getProductListByBrands(brandId: widget.brandId!);
        isCategory = true;
      }
    } else {
      isCategory = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category ?? 'Products',
          style: const TextStyle(
            fontFamily: 'Poppins',
          ),
        ),


      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GetBuilder<ProductController>(builder: (controller) {
          return Visibility(
            visible: controller.inProgress == false,
            replacement: const ShimmerProductListGridView(),
            child: Visibility(
              visible: isCategory
                  ? controller.productListModel.productList?.isNotEmpty ?? false
                  : widget.productListModel?.productList?.isNotEmpty ?? false,
              replacement: const Center(
                child: Text('No Products',style: TextStyle(fontSize: 15,fontFamily: 'mn'),),
              ),
              child: GridView.builder(
                itemCount: isCategory
                    ? controller.productListModel.productList?.length ?? 0
                    : widget.productListModel?.productList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.70,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 5
                ),
                itemBuilder: (context, index) {
                  return ProductCard(
                    productModel: isCategory
                        ? controller.productListModel.productList![index]
                        : widget.productListModel!.productList![index],
                  );
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
