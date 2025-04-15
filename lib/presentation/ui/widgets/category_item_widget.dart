import 'package:medical_app/data/models/category_model.dart';
import 'package:medical_app/presentation/ui/screen/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          categoryId: category.id?.toInt() ?? 0,
          category: category.categoryName,
        ));
      },
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.network(
              "https://medblocks.appsowk.org/${category.categoryImg.toString()}",
              height: 70,
              width: 84,
            ),
          ),
          SizedBox(
            width: 84,
            child: Text(
              category?.categoryName ?? 'Medicines',
              maxLines: 2,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 11.5,
                fontWeight: FontWeight.w500,
                fontFamily: 'mn',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
