import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/state_holders/invoice_product_controller.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/utility/app_colors.dart';
import 'package:dream_dev_journey_flutter/module18_22_flutter_ecommerce_project/presentation/ui/widgets/center_circular_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InvoiceProductListScreen extends StatefulWidget {
  const InvoiceProductListScreen({super.key, required this.invoiceId});

  final int invoiceId;

  @override
  State<InvoiceProductListScreen> createState() =>
      _InvoiceProductListScreenState();
}

class _InvoiceProductListScreenState extends State<InvoiceProductListScreen> {
  final InvoiceProductController _invoiceProductController =
      Get.put(InvoiceProductController());

  @override
  void initState() {
    super.initState();
    _invoiceProductController.fetchInvoiceProducts(widget.invoiceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            CupertinoIcons.left_chevron,
          ),
        ),
        title: Text("Invoice List",
            style: TextStyle(
              fontSize: 18,
            )),
      ),
      body: GetBuilder<InvoiceProductController>(
        builder: (invoiceProductController) {
          if (invoiceProductController.inProgress) {
            return const CenterCircularProgressIndicator();
          }
          if (invoiceProductController.invoiceProductList.isEmpty) {
            return Center(
              child: Text(
                "No products found in this invoice",
              ),
            );
          }
          return ListView.builder(
            itemCount: invoiceProductController.invoiceProductList.length,
            itemBuilder: (context, index) {
              final product =
                  invoiceProductController.invoiceProductList[index].product;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Row(
                    children: [
                      Image.network(
                        product?.image ?? "",
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      product?.title ?? "",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Price: ${product?.price}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text(
                                          "Qty: ${invoiceProductController.invoiceProductList[index].qty}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
