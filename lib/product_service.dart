import 'package:http/http.dart' as http;
import 'package:stashly/product.dart';
import 'dart:convert';
import 'package:stashly/product.dart'; // Pastikan ini adalah path yang benar

class ProductService {
  final String baseUrl = 'http://localhost:8000'; // Ganti dengan URL server Django Anda

  // Mengambil daftar produk
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/json/'));
    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  // Menambahkan produk baru
  Future<void> addProduct(Product product) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/create_product_json/'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: json.encode(product.toJson()),
    );

    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode != 201) {
      throw Exception('Failed to add product');
    }
  } catch (e) {
    print('Error adding product: $e');
    throw e; // Re-throw the error
  }
}

  // Memperbarui produk yang ada
  Future<void> updateProduct(int id, Product product) async {
    final response = await http.post(
      Uri.parse('$baseUrl/edit_product_json/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(product.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update product');
    }
  }

  // Menghapus produk
  Future<void> deleteProduct(int id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/delete_product_json/$id/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete product');
    }
  }
}
