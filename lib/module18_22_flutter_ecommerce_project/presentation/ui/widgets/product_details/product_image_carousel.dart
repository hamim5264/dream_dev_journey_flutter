import 'package:carousel_slider/carousel_slider.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImageCarousel extends StatefulWidget {
  const ProductImageCarousel({
    super.key,
    this.height,
  });

  final double? height;

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final ValueNotifier<int> _currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: widget.height ?? 220.0,
            onPageChanged: (index, reason) {
              _currentIndex.value = index;
            },
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Text $i",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
            valueListenable: _currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color:
                            i == index ? AppColors.primaryColor : Colors.white,
                        border: Border.all(
                          color: i == index
                              ? AppColors.primaryColor
                              : Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
