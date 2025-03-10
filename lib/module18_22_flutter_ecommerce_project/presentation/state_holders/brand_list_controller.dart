import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/brand_list_model.dart';
import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class BrandListController extends GetxController {
  bool _inProgress = false;

  String _errorMessage = '';

  BrandListModel _brandListModel = BrandListModel();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage;

  BrandListModel get branListModel => _brandListModel;

  Future<bool> getBrandList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller().getRequest(Urls.brandList);
    _inProgress = false;
    if (response.isSuccess) {
      _brandListModel = BrandListModel.fromJson(response.responseData);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    update();
    return isSuccess;
  }
}
