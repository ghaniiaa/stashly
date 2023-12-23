import 'package:flutter/material.dart';
import 'package:stashly/product.dart';
import 'package:stashly/product_service.dart';
import 'package:stashly/form_inventory.dart';
import 'package:stashly/list_item.dart';
import 'package:stashly/left_drawer.dart';
import 'package:stashly/login.dart';

class InventoryPage extends StatefulWidget {
  @override
  _InventoryPageState createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
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

  void _navigateToAddProduct() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormInventory(
          onProductSaved: _loadProducts,
        ),
      ),
    );
  }

  void _navigateToListItem() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListItemPage(products: products)),
    );
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Stashly Inventory',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: LeftDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurple[50]!, Colors.purple[100]!],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildCard(Icons.add, 'Tambah Item', _navigateToAddProduct, Colors.blue),
                  _buildCard(Icons.view_list, 'Lihat Item', _navigateToListItem, Colors.green),
                  _buildCard(Icons.logout, 'Logout', _logout, Colors.redAccent),
                ],
              ),
            ),
    );
  }

  Widget _buildCard(IconData icon, String title, VoidCallback onTap, Color color) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 4.0,
          shadowColor: Colors.black.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 40, color: color),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
