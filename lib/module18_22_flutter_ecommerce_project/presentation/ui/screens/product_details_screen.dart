import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/reviews_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_colors.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/product_details/product_image_carousel.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  ValueNotifier<int> noOfItems = ValueNotifier(1);
  List<Color> colors = [
    Colors.purpleAccent,
    Colors.blue,
    Colors.amber,
    Colors.red,
    Colors.green,
  ];
  List<String> sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  Color _selectedColor = Colors.purpleAccent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product Details",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const ProductImageCarousel(),
                  productDetailsBody,
                ],
              ),
            ),
          ),
          priceAndAddToCartSection,
        ],
      ),
    );
  }

  Padding get productDetailsBody {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Happy New Year Special Deal Save 30%",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              ValueListenableBuilder(
                  valueListenable: noOfItems,
                  builder: (context, value, _) {
                    ///--> Design a item counter
                    return ItemCount(
                      initialValue: value,
                      minValue: 1,
                      maxValue: 20,
                      decimalPlaces: 0,
                      step: 1,
                      color: AppColors.primaryColor,
                      onChanged: (v) {
                        noOfItems.value = v.toInt();
                      },
                    );
                  }),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          reviewAndRatingRow,
          const SizedBox(
            height: 16,
          ),
          Text(
            "Color",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          ColorSelector(
              colors: colors,
              onChange: (selectedColor) {
                _selectedColor = selectedColor;
              }),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Size",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizeSelector(
            sizes: sizes,
            onChange: (s) {},
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Description",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "Smartwatch X1 Pro – A sleek, waterproof smartwatch with heart rate monitoring, fitness tracking, and a 7-day battery life. Stay connected on the go! ⌚🚀 With customizable watch faces and real-time notifications, it's your perfect daily companion.",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Row get reviewAndRatingRow {
    return Row(
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(
              CupertinoIcons.star_fill,
              color: Colors.amber,
              size: 16,
            ),
            const SizedBox(
              width: 2,
            ),
            Text(
              "4.4",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black54,
              ),
            ),
          ],
        ),
        const SizedBox(
          width: 8,
        ),
        TextButton(
            onPressed: () {
              Get.to(const ReviewsScreen());
            },
            child: Text(
              "Reviews",
              style: TextStyle(
                fontSize: 16,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            )),
        const SizedBox(
          width: 8,
        ),
        const SizedBox(
          width: 8,
        ),
        Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              CupertinoIcons.heart,
              size: 16,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Container get priceAndAddToCartSection {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.15),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Price",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black45,
                ),
              ),
              Text(
                "\$1,000",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 100,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text(
                "Add To Cart",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
