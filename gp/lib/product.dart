import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Product {
  final String name;
  final String price;
  final String count;
  final String imageData; // String format of image data
  final String contentType;

  Product(
      {required this.name,
      required this.price,
      required this.count,
      required this.imageData,
      required this.contentType});
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  late List<Product> products = []; // Initialize products with an empty list

  @override
  void initState() {
    super.initState();
    // Fetch products from MongoDB here
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://192.168.68.55/products'));
    if (response.statusCode == 200) {
      // Decode JSON response
      final jsonData = jsonDecode(response.body);
      // Extract product information
      List<Product> productList = [];
      for (var item in jsonData) {
        productList.add(Product(
          name: item['nameproduct'],
          price: item['priceproduct'].toString(),
          count: item['countproduct'].toString(),
          imageData: item['data'],
          contentType: item['contentType'],
        ));
      }
      // Update state with fetched products
      setState(() {
        products = productList;
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(products[index].name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ${products[index].price}'),
                  Text('Count: ${products[index].count}'),
                ],
              ),
              // leading: Image.network(
              //   'http://192.168.1.126:3000/products${products[index].imageData}', // Assuming image data is served from an API endpoint
              //   fit: BoxFit.cover,
              //   width: 100,
              //   height: 100,
              // ),
              leading:Image.network(
                'https://drive.google.com/drive/u/3/folders/1ndCvGFWrrtJH02M_8hjIoFu5-k5N13Lx',
                errorBuilder: (context, error, stackTrace) {
                  return Text('Failed to load image');
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
 
