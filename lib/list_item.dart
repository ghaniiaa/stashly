import 'package:flutter/material.dart';
import 'package:stashly/product.dart';

class ListItemPage extends StatelessWidget {
  final List<Product> products;

  ListItemPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Products'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(products[index]);
          },
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
  return Card(
    elevation: 4,
    shadowColor: Colors.deepPurple.withOpacity(0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.fields.name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis, // Prevent overflow
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                'Description: ${product.fields.description}',
                maxLines: 3,
                overflow: TextOverflow.ellipsis, // Use ellipsis for overflow
              ),
            ),
          ),
          Text('Category: ${product.fields.category}'),
          Text('Amount: ${product.fields.amount}'),
          Text('Price: ${product.fields.price}'),
        ],
      ),
    ),
  );
}

}