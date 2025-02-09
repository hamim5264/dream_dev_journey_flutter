import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/rest_api/rest_client.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/screens/product_create_screen.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/screens/product_update_screen.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_pre_practice/crud_app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductGridViewScreen extends StatefulWidget {
  const ProductGridViewScreen({super.key});

  @override
  State<ProductGridViewScreen> createState() => _ProductGridViewScreenState();
}

class _ProductGridViewScreenState extends State<ProductGridViewScreen> {
  List productList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    callProductData();
  }

  callProductData() async {
    isLoading = true;
    var data = await productGridViewListRequest();
    setState(() {
      productList = data;
      isLoading = false;
    });
  }

  deleteItem(id) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Delete"),
            content: const Text("Do you want to delete?"),
            actions: [
              OutlinedButton(
                onPressed: () async {
                  Navigator.pop(context);
                  setState(() {
                    isLoading = true;
                  });
                  await productDeleteRequest(id);
                  await callProductData();
                },
                child: const Text(
                  "Yes",
                  style: TextStyle(
                    color: colorRed,
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                  style: TextStyle(
                    color: colorGreen,
                  ),
                ),
              ),
            ],
          );
        });
  }

  goToUpdate(context, productItem) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductUpdateScreen(productItem)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product List",
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
                : RefreshIndicator(
                    color: colorGreen,
                    onRefresh: () async {
                      await callProductData();
                    },
                    child: GridView.builder(
                        gridDelegate: crudProductGridViewStyle(),
                        itemCount: productList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: Colors.white,
                            elevation: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Image.network(
                                    productList[index]["Img"],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                    color: Colors.white,
                                  ),
                                  //color: colorWhite,
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        productList[index]["ProductName"],
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          "Price: ${productList[index]["UnitPrice"]} BDT"),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {
                                              goToUpdate(
                                                  context, productList[index]);
                                            },
                                            child: const Icon(
                                              CupertinoIcons
                                                  .ellipsis_vertical_circle,
                                              color: colorGreen,
                                              size: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          OutlinedButton(
                                            onPressed: () {
                                              deleteItem(
                                                  productList[index]["_id"]);
                                            },
                                            child: const Icon(
                                              CupertinoIcons.delete,
                                              color: colorRed,
                                              size: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorGreen,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100),
            borderSide: BorderSide.none),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductCreateScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
