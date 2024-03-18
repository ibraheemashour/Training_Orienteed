import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CategoryPage.dart';
import 'addproduct.dart';
import 'exerciseslist.dart';
import 'product.dart';
import 'showexercises.dart';
import 'signupPage.dart';
import 'bmi.dart';
import 'bfp.dart';

class Market extends StatefulWidget {
  final String baseUrl;
  const Market({Key? key, required this.baseUrl}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<Market> {
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
            price: productData['priceproduct'].toInt(),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 40,
                      color: Colors.blue[800],
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                      iconSize: 40,
                      color: Colors.blue[800],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Categories",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 30),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BMIPage(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.fitness_center, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("BMI", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => BfpCalculator(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.boy_rounded, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("BFP", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ImageUploadScreen(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.add_shopping_cart_rounded, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("Add Product", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ImageDisplayScreen(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("Shopping", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ExercisesListPage(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.sports_gymnastics_sharp, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("Exercises", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: EdgeInsets.all(10),
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CategoryPage(baseUrl: widget.baseUrl)),
                              );
                            },
                            icon: Icon(Icons.food_bank, size: 30, color: Colors.blue[800]),
                          ),
                        ),
                        Text("Foods", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text("Products", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800])),
              SizedBox(height: 5),
              SingleChildScrollView(
                child: Wrap(
                  spacing: 4.0,
                  runSpacing: 4.0,
                  alignment: WrapAlignment.spaceEvenly,
                  children: List.generate(
                    (products.length / 2).ceil(),
                    (index) {
                      int startIndex = index * 2;
                      int endIndex = (index * 2) + 2 < products.length ? (index * 2) + 2 : products.length;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: products.getRange(startIndex, endIndex).map((product) {
                          return Expanded(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 2 - 8.0,
                              child: Card(
                                elevation: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 220,
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
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 4),
                                          Text('Price: \$${product.price}', style: TextStyle(fontSize: 16)),
                                          SizedBox(height: 4),
                                          Text('Count: ${product.count}', style: TextStyle(fontSize: 16)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////
 