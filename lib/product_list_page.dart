// product_list_page.dart
import 'package:flutter/material.dart';
import 'package:stashly/product.dart'; // Import Product model

class ProductListPage extends StatelessWidget {
  final List<Product> products; // List of products

  const ProductListPage({Key? key, required this.products}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('Price: ${product.price}\nDescription: ${product.description}'),
          );
        },
      ),
    );
  }
}