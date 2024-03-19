import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Product {
  final int id;
  final String name;
  final int price; // Change the type to int
  final int count;
  final Uint8List imageData;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.count,
    required this.imageData,
  });
}

class ImageDisplayScreen extends StatefulWidget {
  final String baseUrl;
  const ImageDisplayScreen({Key? key, required this.baseUrl}) : super(key: key);
  @override
  _ImageDisplayScreenState createState() => _ImageDisplayScreenState();
}

class _ImageDisplayScreenState extends State<ImageDisplayScreen> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }
 
  Future<void> fetchProducts() async {


    final response = await http.get(Uri.parse('${widget.baseUrl}/products'));
 

    if (response.statusCode == 200) {
      final List<dynamic> productsData = jsonDecode(response.body);
      setState(() {
        products = productsData.map((productData) {
          final List<int> bufferData = List<int>.from(productData['data']['data']);
          final Uint8List imageData = Uint8List.fromList(bufferData);
          return Product(
            id: productData['idproduct'],
            name: productData['nameproduct'],
            price: productData['priceproduct'].toInt(), // Convert to int
            count: productData['countproduct'],
            imageData: imageData,
          );
        }).toList();
      });
    } else {
      print('Failed to fetch products. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products',style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),),
         leading: IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 40,
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
      ),
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: products.map((product) {
            return SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 8.0, // Adjust item width to fit two items in a row
              child: Card(
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 200, // Set the height of the image container
                      child: Image.memory(
                        product.imageData,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Price: \$${product.price}',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Count: ${product.count}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
