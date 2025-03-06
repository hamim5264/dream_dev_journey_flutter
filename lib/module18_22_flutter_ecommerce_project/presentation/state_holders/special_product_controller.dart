import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/product_list_model.dart';
import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class SpecialProductController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;
  String _errorMessage = "";

  String get errorMessage => _errorMessage;

  ProductListModel _productListModel = ProductListModel();

  ProductListModel get productListModel => _productListModel;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.specialProduct);
    _inProgress = false;
    if (response.isSuccess) {
      _productListModel = ProductListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
