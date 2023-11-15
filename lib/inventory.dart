import 'package:flutter/material.dart';
import 'package:stashly/widgets/left_drawer.dart';
import 'package:stashly/inventorylist_form.dart';
import 'package:stashly/product.dart'; // Import Product model
import 'package:stashly/product_list_page.dart'; // Import ProductListPage

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Product> _products = []; // List of products

  final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.checklist, [Colors.blue, Colors.blueAccent]),
    InventoryItem("Tambah Item", Icons.add_shopping_cart, [Colors.green, Colors.teal]),
    InventoryItem("Logout", Icons.logout, [Colors.redAccent, Colors.red]), 
  ];

 void _addNewProduct(Product product) {
    setState(() {
      _products.add(product);
      print("Produk ditambahkan: ${product.name}");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.blueAccent],
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn,
          child: const Text(
            'Stashly',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      drawer: LeftDrawer(
        products: _products, 
        onProductAdded: _addNewProduct,), // Updated to pass products
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Less clutter, more clarity. Welcome to Stashly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  return InventoryCard(item, onProductAdded: _addNewProduct, products: _products);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InventoryItem {
  final String name;
  final IconData icon;
  final List<Color> colors;

  InventoryItem(this.name, this.icon, this.colors);
}

class InventoryCard extends StatelessWidget {
  final InventoryItem item;
  final List<Product> products;  // Tambahkan ini
  final Function(Product) onProductAdded;

  InventoryCard(this.item, {Key? key, required this.onProductAdded, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));

          if (item.name == "Tambah Item") {
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
          }
           
          if (item.name == "Lihat Item") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductListPage(products: products)),
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: item.colors,
            ),
          ),
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
