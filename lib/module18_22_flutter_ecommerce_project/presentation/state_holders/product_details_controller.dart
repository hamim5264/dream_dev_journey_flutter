import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/product_details_data.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/product_details_model.dart';
import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;
  ProductDetailsModel _productDetailsModel = ProductDetailsModel();

  ProductDetailsData? get productDetails =>
      _productDetailsModel.productDetailsDataList?.isNotEmpty == true
          ? _productDetailsModel.productDetailsDataList!.first
          : null;

  Future<bool> getProductDetails(int productId) async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response =
        await NetworkCaller().getRequest(Urls.productDetails(productId));
    if (response.isSuccess) {
      _productDetailsModel =
          ProductDetailsModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
