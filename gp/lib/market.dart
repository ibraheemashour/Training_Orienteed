// import 'package:flutter/material.dart';
 
//  class Product {
//   final String name;
//   final String imageUrl;
//   final double price;
//   final int count;

//   Product({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.count,
//   });
// }

// class Market extends StatefulWidget {
 
 
// final String baseUrl;
// const Market({Key? key, required this.baseUrl}) : super(key: key);
//   @override
//   _MarketPageState createState() => _MarketPageState();
// }

// class _MarketPageState extends State<Market> {

//   // Sample list of products
//   final List<Product> products = [
//     Product(name: 'Product 1', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 20.0, count: 5),
//     Product(name: 'Product 2', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 30.0, count: 8),
//     // Add more products as needed
//   ];




//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             Row(children: [
//               Expanded(child: TextFormField(
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.search,color: Colors.blue[800]),
//                   hintText: 'Search',
//                   border: InputBorder.none,
//                   fillColor: Colors.grey[200],
//                   filled: true,

//                 )
//               )),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: IconButton(onPressed: (){}, icon: Icon(Icons.menu),iconSize: 40,color: Colors.blue[800]),
//               )
//             ],),
//             Container(height: 30,),
//             Text("Categories",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//             Container(height: 30,),
//             Container(
//               height: 300,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
                 
//                 children: [
//                   Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.laptop,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Laptop",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
//                   ),
//                      Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.phone_android,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Mobile",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
//                   ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.electric_bike_rounded,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Electric",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
//                   ),
//                      Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.cable_rounded,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Cable",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
                    
//                   ),
//                    Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.sim_card,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Sim",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
//                   ),
//                    Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                     children: [
//                       Container( 
//                         decoration: BoxDecoration(
//                           color: Colors.grey[200],
//                           borderRadius: BorderRadius.circular(30),
//                         ),
//                       child: Icon(Icons.wallet_giftcard,size: 30,color: Colors.blue[800]),
                      
//                       padding: EdgeInsets.all(20),
                      
                      
//                       ),
//                       Text("Gift",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
//                     ],
//                   ),
                 
//                 ],
//               ),
//             ),
//             SizedBox(height:0),
//             Text(
//               "Products",
//               style: TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blue[800]),
//             ),
//             SizedBox(height: 5),
//             GridView.builder(
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               itemCount: products.length,
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 childAspectRatio: 0.75, // Adjust as needed
//               ),
//               itemBuilder: (context, index) {
//                 return Card(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Image.network(
//                         products[index].imageUrl,
//                         height: 50,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           products[index].name,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Price: \$${products[index].price.toStringAsFixed(2)}',
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           'Count: ${products[index].count}',
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: IconButton(
//                           onPressed: () {
//                             // Handle like button press
//                           },
//                           icon: Icon(Icons.favorite_border),
//                           color: Colors.red,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ), 
//           ]
          
//         ),
        
//       ),
       
       
   
//     );
//   }
// }
///////////////////////////////////////
import 'signupPage.dart'; 
import 'package:flutter/material.dart';
import 'bmi.dart';

class Product {
  final String name;
  final String imageUrl;
  final double price;
  final int count;
  bool isLiked;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.count,
    this.isLiked = false,
  });
}

class Market extends StatefulWidget {
  final String baseUrl;
  const Market({Key? key, required this.baseUrl}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<Market> {
  
  final List<Product> products = [
    Product(name: 'Product 1', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 20.0, count: 5),
    Product(name: 'Product 2', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 30.0, count: 8),
    Product(name: 'Product 3', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 40.0, count: 11),
  ];

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
                      Navigator.of(context).pop(); // Navigate back to the previous route
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
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800]),
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
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BMIPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      
                      icon: Icon(Icons.fitness_center, size: 30, color: Colors.blue[800]),
                        ),
                        ),
                      // padding: EdgeInsets.all(20),
                      
                      
                    
                      Text("BMI",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
                    ],
                  ),
                     Padding(padding: EdgeInsets.only(left: 10)),
                    Column(
                    children: [
 
                      ////////////////
                      // IconButton(
                      
                        
                      //   onPressed: () {
                      //     // Navigate to the desired page when the icon is tapped
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                      //     );
                      //   },
                      //   icon: Icon(Icons.phone_android, size: 30, color: Colors.blue[800], ),
                      // ),
                      // Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),

                  ////////////////////////////
                    Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200], // Background color
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: EdgeInsets.all(10), // Adjust padding as needed
                    child: IconButton(
                      onPressed: () {
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BMIPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      icon: Icon(Icons.phone_android, size: 30, color: Colors.blue[800]),
                    ),
                  ),
                  Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),




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
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      
                      icon: Icon(Icons.electric_bike_rounded, size: 30, color: Colors.blue[800]),
                        ),
                        ),
                      // padding: EdgeInsets.all(20),
                      
                      
                    
                      Text("Electric",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
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
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      
                      icon: Icon(Icons.cable, size: 30, color: Colors.blue[800]),
                        ),
                        ),
                      // padding: EdgeInsets.all(20),
                      
                      
                    
                      Text("Cable",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
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
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      
                      icon: Icon(Icons.sim_card, size: 30, color: Colors.blue[800]),
                        ),
                        ),
                      // padding: EdgeInsets.all(20),
                      
                      
                    
                      Text("Sim",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
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
                        // Navigate to the desired page when the icon is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                        );
                      },
                      
                      icon: Icon(Icons.wallet_giftcard, size: 30, color: Colors.blue[800]),
                        ),
                        ),
                      // padding: EdgeInsets.all(20),
                      
                      
                    
                      Text("Gift",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
                    ],
                  ),
                 
                  ],
                ),
              ),
               
            
              SizedBox(height: 20),
              Text(
                "Products",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800]),
              ),
              SizedBox(height: 5),
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6, // Set height of the container
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.55, // Adjust as needed
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              products[index].imageUrl,
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                products[index].name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Price: \$${products[index].price.toStringAsFixed(2)}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Count: ${products[index].count}',
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () {
                                  // Handle like button press
                                   setState(() {
                                    // Toggle like status
                                    products[index].isLiked = !products[index].isLiked;
                                  });
                                },
                                icon: Icon(
                                 products[index].isLiked ? Icons.favorite : Icons.favorite_border,
                                 color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
//  import 'signupPage.dart'; 
// import 'package:flutter/material.dart';

// class Product {
//   final String name;
//   final String imageUrl;
//   final double price;
//   final int count;
//   bool isLiked;

//   Product({
//     required this.name,
//     required this.imageUrl,
//     required this.price,
//     required this.count,
//     this.isLiked = false,
//   });
// }

// class Market extends StatefulWidget {
//   final String baseUrl;
//   const Market({Key? key, required this.baseUrl}) : super(key: key);

//   @override
//   _MarketPageState createState() => _MarketPageState();
// }

// class _MarketPageState extends State<Market> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController imageUrlController = TextEditingController();
//   TextEditingController priceController = TextEditingController();
//   TextEditingController countController = TextEditingController();

//   final List<Product> products = [
//     // Product(name: 'Product 1', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 20.0, count: 5),
//     // Product(name: 'Product 2', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 30.0, count: 8),
//     // Product(name: 'Product 3', imageUrl: 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', price: 40.0, count: 11),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       iconSize: 40,
//                       color: Colors.blue[800],
//                       onPressed: () {
//                         Navigator.of(context).pop(); // Navigate back to the previous route
//                       },
//                     ),
//                   ),
//                   Spacer(),
//                   Spacer(),
//                   Spacer(),
//                   Spacer(),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: Icon(Icons.menu),
//                       iconSize: 40,
//                       color: Colors.blue[800],
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Text(
//                 "Categories",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//               ),
//               SizedBox(height: 30),
//               Container(
//                 height: 100,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.laptop, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Laptop", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.phone_android, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Mobile", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.electric_bike_rounded, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Electric", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.cable_rounded, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Cable", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.sim_card, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Sim", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                     Padding(padding: EdgeInsets.only(left: 10)),
//                     Column(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                           padding: EdgeInsets.all(10),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(Icons.wallet_giftcard, size: 30, color: Colors.blue[800]),
//                           ),
//                         ),
//                         Text("Gift", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue[800])),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Add Product",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'Product Name'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: imageUrlController,
//                 decoration: InputDecoration(labelText: 'Image URL'),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               SizedBox(height: 10),
//               TextFormField(
//                 controller: countController,
//                 decoration: InputDecoration(labelText: 'Count'),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Validate and add product
//                   String name = nameController.text;
//                   String imageUrl = imageUrlController.text;
//                   double price = double.tryParse(priceController.text) ?? 0.0;
//                   int count = int.tryParse(countController.text) ?? 0;
//                   if (name.isNotEmpty && imageUrl.isNotEmpty && price > 0 && count > 0) {
//                     setState(() {
//                       products.add(Product(name: name, imageUrl: imageUrl, price: price, count: count));
//                     });
//                     // Clear input fields after adding product
//                     nameController.clear();
//                     imageUrlController.clear();
//                     priceController.clear();
//                     countController.clear();
//                   } else {
//                     // Show error message if any field is empty or invalid
//                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields with valid data')));
//                   }
//                 },
//                 child: Text('Add Product'),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Products",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//               ),
//               SizedBox(height: 5),
//               SingleChildScrollView(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.6, // Set height of the container
//                   child: GridView.builder(
//                     shrinkWrap: true,
//                     itemCount: products.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.55, // Adjust as needed
//                     ),
//                     itemBuilder: (context, index) {
//                       return Card(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Image.network(
//                               products[index].imageUrl,
//                               height: 150,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 products[index].name,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Price: \$${products[index].price.toStringAsFixed(2)}',
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 'Count: ${products[index].count}',
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: IconButton(
//                                 onPressed: () {
//                                   // Handle like button press
//                                   setState(() {
//                                     // Toggle like status
//                                     products[index].isLiked = !products[index].isLiked;
//                                   });
//                                 },
//                                 icon: Icon(
//                                   products[index].isLiked ? Icons.favorite : Icons.favorite_border,
//                                   color: Colors.red,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
