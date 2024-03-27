import 'package:flutter/material.dart';
// import 'package:gp/addproduct.dart';
// import 'package:gp/market.dart';
// import 'CategoryPage.dart';
// import 'FoodRecipesPage.dart';
// import 'exerciseslist.dart';
import 'loginPage.dart';
// import 'signupPage.dart';
// import 'market.dart';
// import 'product.dart';
// import 'ProductListScreen.dart';
// import 'addProduct.dart';
// import 'bmi.dart';
// import 'home.dart';
// import 'product.dart';
// import 'showposts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //  static const String baseUrl = 'http://192.168.10.122:3000';//office_orienteedGuest
  static const String baseUrl = 'http://192.168.1.126:3000'; //office_orienteed2
  //  static const String baseUrl = 'http://192.168.68.54:3000';//Home
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet Wizard',
      debugShowCheckedModeBanner: false,
      home: LoginPage(baseUrl: baseUrl),
    );
  }
}
