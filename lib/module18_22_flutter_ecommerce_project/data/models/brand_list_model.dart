import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/data/models/brand_model.dart';

class BrandListModel {
  String? msg;
  List<BrandModel>? data;

  BrandListModel({this.msg, this.data});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <BrandModel>[];
      json['data'].forEach((v) {
        data!.add(BrandModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
