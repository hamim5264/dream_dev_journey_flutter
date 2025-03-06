import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/category.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/product_list_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ProductListScreen(
          category: category.categoryName ?? "",
        ));
      },
      child: Column(
        children: [
          Card(
            elevation: 0,
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Image.network(
                category.categoryImg ?? "",
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            category.categoryName ?? "",
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
