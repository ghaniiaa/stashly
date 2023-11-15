import 'package:flutter/material.dart';
import 'package:stashly/inventory.dart';
import 'package:stashly/inventorylist_form.dart';
import 'package:stashly/product_list_page.dart';
import 'package:stashly/product.dart';

class LeftDrawer extends StatelessWidget {
  final List<Product> products;
  final Function(Product) onProductAdded;

  const LeftDrawer({Key? key, required this.products, required this.onProductAdded}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 129, 148, 255),
            ),
            child: Column(
              children: [
                Text(
                  'Stashly',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)),
                Text(
                  "Keep your stuff safe!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_shopping_cart),
            title: const Text('Tambah Item'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InventoryFormPage(
                    onProductAdded: (product) {
                      onProductAdded(product); // Use the callback here
                      Navigator.pop(context); // Go back after adding
                    },
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Lihat Item'),
            onTap: () {
              // Dalam LeftDrawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProductListPage(products: products)),
              );
            },
          ),
        ],
      ),
    );
  }
}
