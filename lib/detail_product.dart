import 'package:flutter/material.dart';
import 'package:stashly/product.dart'; // Ensure this import points to your Product model

class ProductDetailPage extends StatelessWidget {
  final Product product;

  ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.fields.name),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Name: ${product.fields.name}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Description: ${product.fields.description}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Category: ${product.fields.category}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Amount: ${product.fields.amount}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text('Price: ${product.fields.price}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Back to List'),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple,
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}