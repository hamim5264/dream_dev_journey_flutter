import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/product_wish_list_model.dart';
import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class WishListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = "";

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;
  WishListModel _wishListModel = WishListModel();

  WishListModel get wishListModel => _wishListModel;

  Future<bool> createWishList(int wishProductId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.createWishList(wishProductId));
    if (response.isSuccess) {
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> getProductWishList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.productWishList);
    if (response.isSuccess) {
      _wishListModel = WishListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> deleteWishList(int wishId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.removeWishList(wishId));
    if (response.isSuccess) {
      isSuccess = true;
      getProductWishList();
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
