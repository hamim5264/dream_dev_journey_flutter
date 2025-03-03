import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0,
          color: AppColors.primaryColor.withValues(alpha: 0.2),
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              CupertinoIcons.device_desktop,
              size: 32,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Text(
          "Electronics",
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
