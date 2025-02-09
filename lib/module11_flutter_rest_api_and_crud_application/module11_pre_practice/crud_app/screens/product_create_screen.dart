import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/rest_api/rest_client.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/style/style.dart';
import 'package:flutter/material.dart';

class ProductCreateScreen extends StatefulWidget {
  const ProductCreateScreen({super.key});

  @override
  State<ProductCreateScreen> createState() => _ProductCreateScreenState();
}

class _ProductCreateScreenState extends State<ProductCreateScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _imgTEController = TextEditingController();
  final TextEditingController _qtyTEController = TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();

  Map<String, String> formValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "Qty": "",
    "UnitPrice": "",
    "TotalPrice": ""
  };

  bool isLoading = false;

  inputOnChange(mapKey, textValue) {
    formValues.update(mapKey, (value) => textValue);
    setState(() {});
  }

  formOnSubmit() async {
    if (formValues["ProductName"]!.isEmpty) {
      crudErrorToast("Product name required!");
    } else if (formValues["ProductCode"]!.isEmpty) {
      crudErrorToast("Product code required!");
    } else if (formValues["Img"]!.isEmpty) {
      crudErrorToast("Product image url required!");
    } else if (formValues["Qty"]!.isEmpty) {
      crudErrorToast("Product quantity required!");
    } else if (formValues["UnitPrice"]!.isEmpty) {
      crudErrorToast("Unit price required!");
    } else if (formValues["TotalPrice"]!.isEmpty) {
      crudErrorToast("Total price required!");
    } else {
      setState(() {
        isLoading = true;
      });
      await productCreateRequest(formValues);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Product",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          crudScreenBackground(context),
          Container(
              child: isLoading
                  ? (Center(
                      child: const CircularProgressIndicator(
                        color: colorGreen,
                      ),
                    ))
                  : (SingleChildScrollView(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: crudAppInputDecoration(
                              "Product Name",
                            ),
                            onChanged: (textValue) {
                              inputOnChange("ProductName", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: crudAppInputDecoration(
                              "Product Code",
                            ),
                            onChanged: (textValue) {
                              inputOnChange("ProductCode", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: crudAppInputDecoration(
                              "Product Image Url",
                            ),
                            onChanged: (textValue) {
                              inputOnChange("Img", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          crudAppDropDownStyle(
                            DropdownButton(
                              dropdownColor: colorWhite,
                              items: [
                                DropdownMenuItem(
                                  value: "",
                                  child: const Text(
                                    "Select Quantity",
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "1 Piece",
                                  child: const Text(
                                    "1 Piece",
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "2 Piece",
                                  child: const Text(
                                    "2 Piece",
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "3 Piece",
                                  child: const Text(
                                    "3 Piece",
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "4 Piece",
                                  child: const Text(
                                    "4 Piece",
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: "5 Piece",
                                  child: const Text(
                                    "5 Piece",
                                  ),
                                ),
                              ],
                              onChanged: (textValue) {
                                inputOnChange("Qty", textValue);
                              },
                              value: formValues["Qty"],
                              underline: Container(),
                              isExpanded: true,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: crudAppInputDecoration(
                              "Unit Price",
                            ),
                            onChanged: (textValue) {
                              inputOnChange("UnitPrice", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: crudAppInputDecoration(
                              "Total Price",
                            ),
                            onChanged: (textValue) {
                              inputOnChange("TotalPrice", textValue);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: crudAppButtonStyle(),
                            onPressed: () {
                              formOnSubmit();
                              _productNameTEController.clear();
                              _productCodeTEController.clear();
                              _imgTEController.clear();
                              _qtyTEController.clear();
                              _unitPriceTEController.clear();
                              _totalPriceTEController.clear();
                            },
                            child: crudAppSuccessButtonChild("Submit"),
                          ),
                        ],
                      ),
                    ))),
        ],
      ),
    );
  }
}
