import 'dart:convert';

import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key, this.product});

  final Product? product;

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {
  final TextEditingController _productNameTEController =
      TextEditingController();
  final TextEditingController _productCodeTEController =
      TextEditingController();
  final TextEditingController _productImageTEController =
      TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool addInProgress = false;

  Future<void> addNewProduct() async {
    addInProgress = true;
    setState(() {});
    final Map<String, String> inputMap = {
      "Img": _productImageTEController.text.trim(),
      "ProductCode": _productCodeTEController.text.trim(),
      "ProductName": _productNameTEController.text.trim(),
      "Qty": _quantityTEController.text.trim(),
      "TotalPrice": _totalPriceTEController.text.trim(),
      "UnitPrice": _priceTEController.text.trim()
    };

    final Response response = await post(
        Uri.parse("https://crud.teamrabbil.com/api/v1/CreateProduct"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(inputMap));
    if (response.statusCode == 200) {
      _productNameTEController.clear();
      _productCodeTEController.clear();
      _productImageTEController.clear();
      _quantityTEController.clear();
      _priceTEController.clear();
      _totalPriceTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product has been added."),
        ),
      );
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product code should be unique."),
        ),
      );
    }
    addInProgress = false;
    setState(() {});
  }

  Future<void> updateProduct() async {
    addInProgress = true;
    setState(() {});
    final Product product = Product(
        "",
        _productNameTEController.text.trim(),
        _productCodeTEController.text.trim(),
        _productImageTEController.text.trim(),
        _priceTEController.text.trim(),
        _quantityTEController.text.trim(),
        _totalPriceTEController.text.trim());
    // final Map<String, String> inputMap = {
    //   "Img": _productImageTEController.text.trim(),
    //   "ProductCode": _productCodeTEController.text.trim(),
    //   "ProductName": _productNameTEController.text.trim(),
    //   "Qty": _quantityTEController.text.trim(),
    //   "TotalPrice": _totalPriceTEController.text.trim(),
    //   "UnitPrice": _priceTEController.text.trim()
    // };

    final Response response = await post(
        Uri.parse(
            "https://crud.teamrabbil.com/api/v1/UpdateProduct/${widget.product!.id}"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(product.toJson()));

    if (response.statusCode == 200) {
      _productNameTEController.clear();
      _productCodeTEController.clear();
      _productImageTEController.clear();
      _quantityTEController.clear();
      _priceTEController.clear();
      _totalPriceTEController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product has been updated."),
        ),
      );
    } else if (response.statusCode == 400) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Product code should be unique."),
        ),
      );
    }
    addInProgress = false;
    setState(() {});
  }

  @override
  void initState() {
    if (widget.product != null) {
      _productNameTEController.text = widget.product!.productName;
      _productCodeTEController.text = widget.product!.productCode;
      _productImageTEController.text = widget.product!.image;
      _quantityTEController.text = widget.product!.quantity;
      _priceTEController.text = widget.product!.unitPrice;
      _totalPriceTEController.text = widget.product!.totalPrice;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add new product",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productNameTEController,
                  cursorColor: Colors.orangeAccent,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text(
                      "Product Name",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    hintText: "Enter product title",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _productCodeTEController,
                  cursorColor: Colors.orangeAccent,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Product Code",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    hintText: "Enter product code",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _productImageTEController,
                  cursorColor: Colors.orangeAccent,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Product Image",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    hintText: "Enter product image url",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _quantityTEController,
                  cursorColor: Colors.orangeAccent,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Quantity",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    hintText: "Enter quantity",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _priceTEController,
                  cursorColor: Colors.orangeAccent,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    label: Text("Unit Price",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    hintText: "Enter product price",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 14,
                ),
                TextFormField(
                  controller: _totalPriceTEController,
                  cursorColor: Colors.orangeAccent,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    label: Text("Total Price",
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    hintText: "Enter total price",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                  validator: isValidate,
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: addInProgress
                      ? Center(
                          child: const CircularProgressIndicator(
                            color: Colors.orangeAccent,
                          ),
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: Colors.orangeAccent,
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (widget.product == null) {
                                addNewProduct();
                              } else {
                                updateProduct();
                              }
                            }
                          },
                          child: widget.product != null
                              ? Text("Update",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ))
                              : Text(
                                  "Add",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? isValidate(String? value) {
    if (value?.trim().isNotEmpty ?? false) {
      return null;
    }
    return "Enter valid value";
  }

  @override
  void dispose() {
    super.dispose();
    _productNameTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();
    _priceTEController.dispose();
    _totalPriceTEController.dispose();
    _productImageTEController.dispose();
  }
}
