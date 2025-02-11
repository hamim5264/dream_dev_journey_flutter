import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/add_new_product_screen.dart';
import 'package:dream_dev_journey_flutter/module11_flutter_rest_api_and_crud_application/module11_live_class/CRUD_APPLICATION/application_screens/product.dart';
import 'package:flutter/material.dart';

/// Also we can use -> ExpansionTile instead of ListTile
class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.product, required this.onPressDelete});

  final Product product;
  final Function(String) onPressDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ListTile(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return productActionDialog(context);
                });
          },
          leading: Image.network(
            product.image,
            width: 80,
          ),
          title: Text(
            product.productName,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Product Code: ${product.productCode}",
              ),
              Text(
                "Total Price: ${product.totalPrice}",
              ),
              Text(
                "Quantity: ${product.quantity}",
              ),
            ],
          ),
          trailing: Text(
            "\$${product.unitPrice}",
            style: const TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  AlertDialog productActionDialog(BuildContext context) {
    return AlertDialog(
      title: const Text("Select an action"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(
              Icons.edit,
              color: Colors.orangeAccent,
            ),
            title: const Text(
              "Edit",
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewProductScreen(
                    product: product,
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 0,
          ),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            title: const Text(
              "Delete",
            ),
            onTap: () {
              Navigator.pop(context);
              onPressDelete(product.id);
            },
          ),
        ],
      ),
    );
  }
}
