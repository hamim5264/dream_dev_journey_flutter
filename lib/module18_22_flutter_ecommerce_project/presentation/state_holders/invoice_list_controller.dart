import 'package:get/get.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/invoice_list_model.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/services/network_caller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/utility/urls.dart';

class InvoiceListController extends GetxController {
  bool _inProgress = false;
  List<InvoiceListModel> _invoiceList = [];
  String _errorMessage = '';

  bool get inProgress => _inProgress;

  List<InvoiceListModel> get invoiceList => _invoiceList;

  String get errorMessage => _errorMessage;

  Future<void> fetchInvoices() async {
    _inProgress = true;
    update();

    final response = await NetworkCaller().getRequest(Urls.invoiceList);
    _inProgress = false;

    if (response.isSuccess) {
      try {
        List<dynamic> responseData = response.responseData;
        _invoiceList =
            responseData.map((e) => InvoiceListModel.fromJson(e)).toList();
      } catch (e) {
        _errorMessage = "Data parsing error: $e";
      }
    } else {
      _errorMessage = response.errorMessage;
    }

    update();
  }
}
