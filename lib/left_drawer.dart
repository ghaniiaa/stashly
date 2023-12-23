import 'package:flutter/material.dart';
import 'package:stashly/form_inventory.dart';
import 'package:stashly/list_item.dart';
import 'package:stashly/login.dart';
import 'package:stashly/product.dart';
import 'package:stashly/product_service.dart';

class LeftDrawer extends StatefulWidget {
  @override
  _LeftDrawerState createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  final ProductService productService = ProductService();
  late List<Product> products;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  void _loadProducts() async {
    try {
      products = await productService.getProducts();
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _navigateToAddProduct(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormInventory(
          onProductSaved: _loadProducts,
        ),
      ),
    );
  }

  void _navigateToListItem(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListItemPage(products: products)),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Stashly',
              style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple[700]!, const Color.fromARGB(255, 178, 145, 234)!],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () => Navigator.pop(context)),
          _buildDrawerItem(Icons.add, 'Tambah Item', () => _navigateToAddProduct(context)),
          _buildDrawerItem(Icons.list, 'Lihat Item', () => _navigateToListItem(context)),
          _buildDrawerItem(Icons.exit_to_app, 'Logout', () => _logout(context)),
          // Add other menu items if needed
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0))),
      onTap: onTap,
    );
  }
}

