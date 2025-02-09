import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/rest_api/rest_client.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/screens/product_grid_view_screen.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/style/style.dart';
import 'package:flutter/material.dart';

class ProductUpdateScreen extends StatefulWidget {
  const ProductUpdateScreen(this.productItem, {super.key});

  final Map productItem;

  @override
  State<ProductUpdateScreen> createState() => _ProductUpdateScreenState();
}

class _ProductUpdateScreenState extends State<ProductUpdateScreen> {
  Map<String, String> formValues = {
    "ProductName": "",
    "ProductCode": "",
    "Img": "",
    "Qty": "",
    "UnitPrice": "",
    "TotalPrice": ""
  };

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      formValues.update(
          "ProductName", (value) => widget.productItem["ProductName"]);
      formValues.update(
          "ProductCode", (value) => widget.productItem["ProductCode"]);
      formValues.update("Img", (value) => widget.productItem["Img"]);

      String initialQty = widget.productItem["Qty"] ?? "1 Piece";
      List<String> validQtyValues = [
        "1 Piece",
        "2 Piece",
        "3 Piece",
        "4 Piece",
        "5 Piece"
      ];

      if (!validQtyValues.contains(initialQty)) {
        initialQty = "1 Piece";
      }
      formValues.update("Qty", (value) => initialQty);

      formValues.update(
          "UnitPrice", (value) => widget.productItem["UnitPrice"]);
      formValues.update(
          "TotalPrice", (value) => widget.productItem["TotalPrice"]);
    });
  }

  inputOnChange(mapKey, textValue) {
    formValues.update(mapKey, (value) => textValue);
    setState(() {});
  }

  formOnUpdate() async {
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
      await productUpdateRequest(formValues, widget.productItem["_id"]);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ProductGridViewScreen()),
          (Route route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update Product",
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
                            initialValue: formValues["ProductName"],
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
                            initialValue: formValues["ProductCode"],
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
                            initialValue: formValues["Img"],
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
                            DropdownButton<String>(
                              dropdownColor: colorWhite,
                              items: [
                                DropdownMenuItem(
                                    value: "1 Piece",
                                    child: const Text("1 Piece")),
                                DropdownMenuItem(
                                    value: "2 Piece",
                                    child: const Text("2 Piece")),
                                DropdownMenuItem(
                                    value: "3 Piece",
                                    child: const Text("3 Piece")),
                                DropdownMenuItem(
                                    value: "4 Piece",
                                    child: const Text("4 Piece")),
                                DropdownMenuItem(
                                    value: "5 Piece",
                                    child: const Text("5 Piece")),
                              ],
                              onChanged: (textValue) {
                                if (textValue != null) {
                                  inputOnChange("Qty", textValue);
                                }
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
                            initialValue: formValues["UnitPrice"],
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
                            initialValue: formValues["TotalPrice"],
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
                              formOnUpdate();
                            },
                            child: crudAppSuccessButtonChild("Update"),
                          ),
                        ],
                      ),
                    ))),
        ],
      ),
    );
  }
}
