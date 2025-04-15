import 'package:medical_app/presentation/state_holders/bottom_nav_controller.dart';
import 'package:medical_app/presentation/state_holders/category_list_controller.dart';
import 'package:medical_app/presentation/ui/widgets/category_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_app/presentation/ui/widgets/shimmer_effect/shimmer_category_list.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Get.find<BottomNavController>().changeIndex(0);
      },
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Categories',
            style: TextStyle(
              fontSize: 20,

              fontFamily: 'Poppins',
            ),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            Get.find<CategoryListController>().getCategoryList();
          },
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: GetBuilder<CategoryListController>(builder: (controller) {
              return Visibility(
                visible: controller.inProgress == false,
                replacement: ShimmerCategoryGridView(),
                child: GridView.builder(
                  itemCount: controller.categoryListModel.categoryList?.length ?? 0,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.8,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return CategoryItem(
                      category:
                          controller.categoryListModel.categoryList![index],
                    );
                  },
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
