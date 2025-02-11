import 'dart:convert';

import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/add_new_product_screen.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/product.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];

  bool inProgress = false;

  @override
  void initState() {
    getProductList();
    super.initState();
  }

  void getProductList() async {
    productList.clear();
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      if (responseData["status"] == "success") {
        for (Map<String, dynamic> productJson in responseData["data"]) {
          productList.add(Product.fromJson(productJson));
        }
      }
    }
    inProgress = false;
    setState(() {});
  }

  void deleteProduct(String productID) async {
    inProgress = true;
    setState(() {});
    Response response = await get(
      Uri.parse("https://crud.teamrabbil.com/api/v1/DeleteProduct/$productID"),
    );

    if (response.statusCode == 200) {
      getProductList();
    } else {
      inProgress = false;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              getProductList();
            },
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          ),
        ],
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddNewProductScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: RefreshIndicator(
        color: Colors.orangeAccent,
        onRefresh: () async {
          getProductList();
        },
        child: inProgress
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              )
            : ListView.builder(
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return ProductItem(
                    product: productList[index],
                    onPressDelete: (String productID) {
                      deleteProduct(productID);
                    },
                  );
                },
              ),
      ),
    );
  }
}
