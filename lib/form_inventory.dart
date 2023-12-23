import 'package:flutter/material.dart';
import 'package:stashly/product.dart';
import 'package:stashly/product_service.dart';

class FormInventory extends StatefulWidget {
  final Function onProductSaved;

  FormInventory({required this.onProductSaved});

  @override
  _FormInventoryState createState() => _FormInventoryState();
}

class _FormInventoryState extends State<FormInventory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  ProductService productService = ProductService();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _amountController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Product newProduct = Product(
        model: 'your_model', // Sesuaikan dengan model Anda
        pk: 0, // Sesuaikan dengan primary key yang diinginkan
        fields: Fields(
          name: _nameController.text,
          dateAdded: _selectedDate,
          amount: int.parse(_amountController.text),
          description: _descriptionController.text,
          category: _categoryController.text,
          price: int.parse(_priceController.text),
          user: 1, // Sesuaikan dengan user ID yang diinginkan
          isLast: false,
        ),
      );

      productService.addProduct(newProduct).then((_) {
        widget.onProductSaved();
        Navigator.pop(context);
      }).catchError((error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $error')),
        );
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFormField(_nameController, 'Name', 'Please enter a name'),
                _buildTextFormField(_descriptionController, 'Description', 'Please enter a description'),
                _buildTextFormField(_categoryController, 'Category', 'Please enter a category'),
                _buildTextFormField(_amountController, 'Amount', 'Please enter an amount', isNumber: true),
                _buildTextFormField(_priceController, 'Price', 'Please enter a price', isNumber: true),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit', style: TextStyle(fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 196, 166, 248),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField _buildTextFormField(TextEditingController controller, String label, String errorText, {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.deepPurple),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepPurple[700]!, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}