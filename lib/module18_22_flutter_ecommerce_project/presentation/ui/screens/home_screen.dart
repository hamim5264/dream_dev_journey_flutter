import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/auth_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/category_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/home_banner_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/main_bottom_nav_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/auth/verify_email_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/screens/product_list_screen.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/assets_path.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/category_item.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/home/circle_icon_button.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/home/banner_carousel.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/home/section_title.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/product_card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              searchTextField,
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 220,
                child: GetBuilder<HomeBannerController>(
                  builder: (homeBannerController) {
                    return Visibility(
                      visible: homeBannerController.inProgress == false,
                      replacement: const CenterCircularProgressIndicator(),
                      child: BannerCarousel(
                        bannerList:
                            homeBannerController.bannerListModel.bannerList ??
                                [],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              SectionTitle(
                title: "All Categories",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().changeIndex(1);
                },
              ),
              categoryList,
              SectionTitle(
                title: "Popular",
                onTapSeeAll: () {
                  Get.to(const ProductListScreen());
                },
              ),
              const SizedBox(
                height: 8,
              ),
              productList,
              SectionTitle(
                title: "Special",
                onTapSeeAll: () {},
              ),
              productList,
              const SizedBox(
                height: 8,
              ),
              SectionTitle(
                title: "New",
                onTapSeeAll: () {},
              ),
              productList,
            ],
          ),
        ),
      ),
    );
  }

  SizedBox get categoryList {
    return SizedBox(
      height: 130,
      child: GetBuilder<CategoryController>(
        builder: (categoryController) {
          return Visibility(
            visible: categoryController.inProgress == false,
            replacement: const CenterCircularProgressIndicator(),
            child: ListView.separated(
              itemCount: categoryController.categoryListModel.categoryList?.length ?? 0,
              primary: false,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItem(
                  category: categoryController.categoryListModel.categoryList![index],
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(
                  width: 8,
                );
              },
            ),
          );
        }
      ),
    );
  }

  SizedBox get productList {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        itemCount: 10,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const ProductCardItem();
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  TextFormField get searchTextField {
    return TextFormField(
      decoration: InputDecoration(
          hintText: "Search",
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8)),
          fillColor: Colors.grey.shade200,
          filled: true,
          prefixIcon: const Icon(
            CupertinoIcons.search,
            color: Colors.grey,
          )),
    );
  }

  AppBar get appBar {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Image.asset(
        AssetsPath.appLogoNav,
      ),
      actions: [
        CircleIconButton(
          onTap: () async {
            AuthController.clearAuthData();
            Get.offAll(() => const VerifyEmailScreen());
          },
          iconData: CupertinoIcons.escape,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: CupertinoIcons.phone,
        ),
        const SizedBox(
          width: 8,
        ),
        CircleIconButton(
          onTap: () {},
          iconData: CupertinoIcons.bell,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
