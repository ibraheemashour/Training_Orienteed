// import 'dart:convert';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Product {
//   final String id;
//   final int idproduct;
//   final String nameproduct;
//   final double priceproduct;
//   final int countproduct;
//   final String imageData; // Add imageData field

//   Product({
//     required this.id,
//     required this.idproduct,
//     required this.nameproduct,
//     required this.priceproduct,
//     required this.countproduct,
//     required this.imageData, // Initialize imageData in the constructor
//   });

//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['_id'],
//       idproduct: json['idproduct'],
//       nameproduct: json['nameproduct'],
//       priceproduct: json['priceproduct'].toDouble(),
//       countproduct: json['countproduct'],
//       imageData: json['data']['data'], // Get the base64-encoded image data
//     );
//   }
// }

// class ProductPage extends StatefulWidget {
//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   List<Product> products = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchProducts();
//   }

//   Future<void> fetchProducts() async {
//     try {
//       final response =
//           await http.get(Uri.parse('http://192.168.68.56:3000/products'));
//       print('Response status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       if (response.statusCode == 200) {
//         if (response.body.isNotEmpty) {
//           Iterable data = json.decode(response.body);
//           List<Product> fetchedProducts =
//               data.map((json) => Product.fromJson(json)).toList();
//           setState(() {
//             products = fetchedProducts;
//           });
//         } else {
//           throw Exception('Response body is empty');
//         }
//       } else {
//         throw Exception('Failed to load products: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Failed to fetch products: $e');
//       // Handle error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Products'),
//       ),
//       body: ListView.builder(
//         itemCount: products.length,
//         itemBuilder: (context, index) {
//           // Decode the base64 string to Uint8List
//           Uint8List decodedImage = base64Decode(products[index].imageData);
//           return ListTile(
//             title: Text(products[index].nameproduct),
//             subtitle:
//                 Text('\$${products[index].priceproduct.toStringAsFixed(2)}'),
//             leading: Image.memory(decodedImage), // Display image
//           );
//         },
//       ),
//     );
//   }
// }
