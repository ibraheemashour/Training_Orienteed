// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Recipe {
//   final String name;
//   final String description;
//   final String imageUrl;
//   final double price;

//   Recipe({
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.price,
//   });
// }

// class FoodRecipesPage extends StatefulWidget {
//   final String baseUrl;
//   const FoodRecipesPage({Key? key, required this.baseUrl}) : super(key: key);
//   @override
//   _FoodRecipesPageState createState() => _FoodRecipesPageState();
// }

// class _FoodRecipesPageState extends State<FoodRecipesPage> {
//   List<Recipe> recipes = [];
//   List<Recipe> filteredRecipes = [];

//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchRecipes();
//   }

//   Future<void> fetchRecipes() async {
//     final response = await http.get(Uri.parse('${widget.baseUrl}/recipes'));

//     if (response.statusCode == 200) {
//       final List<dynamic> recipesData = jsonDecode(response.body);
//       setState(() {
//         recipes = recipesData.map((recipeData) {
//           return Recipe(
//             name: recipeData['name'],
//             description: recipeData['description'],
//             imageUrl: recipeData['imageUrl'],
//             price: recipeData['price'].toDouble(),
//           );
//         }).toList();
//         filteredRecipes = List.from(recipes);
//       });
//     } else {
//       print('Failed to fetch recipes. Status code: ${response.statusCode}');
//     }
//   }

//   void filterRecipes(String query) {
//     setState(() {
//       filteredRecipes = recipes
//           .where((recipe) =>
//               recipe.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Food Recipes'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Food Recipes',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     filterRecipes('');
//                   },
//                 ),
//               ),
//               onChanged: (value) {
//                 filterRecipes(value);
//               },
//             ),
//           ),
//           Expanded(
//             child: filteredRecipes.isEmpty
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: filteredRecipes.length,
//                     itemBuilder: (context, index) {
//                       final recipe = filteredRecipes[index];
//                       return GestureDetector(
//                         onTap: () {
//                           _showDescriptionDialog(context, recipe);
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.network(
//                                 recipe.imageUrl,
//                                 height: 150,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       recipe.name,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Text(
//                                       'Price: \$${recipe.price}',
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//                                     SizedBox(height: 10),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Add to cart functionality
//                                       },
//                                       child: Text('Add to Cart'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showDescriptionDialog(BuildContext context, Recipe recipe) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(recipe.name),
//           content: Text(recipe.description),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'CategoryPage.dart';

// class Recipe {
//   final String name;
//   final String description;
//   final String imageUrl;
//   final double price;

//   Recipe({
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.price,
//   });
// }

// class FoodRecipesPage extends StatefulWidget {
//   final String baseUrl;
//     final String category;

//   const FoodRecipesPage({Key? key, required this.baseUrl, required this.category}) : super(key: key);
//   @override
//   _FoodRecipesPageState createState() => _FoodRecipesPageState();
// }

// class _FoodRecipesPageState extends State<FoodRecipesPage> {
//   List<Recipe> recipes = [];
//   List<Recipe> filteredRecipes = [];

//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchRecipes();
//   }

//   Future<void> fetchRecipes() async {
//     final response = await http.get(Uri.parse('${widget.baseUrl}/recipes'));

//     if (response.statusCode == 200) {
//       final List<dynamic> recipesData = jsonDecode(response.body);
//       setState(() {
//         recipes = recipesData.map((recipeData) {
//           return Recipe(
//             name: recipeData['name'],
//             description: recipeData['description'],
//             imageUrl: recipeData['imageUrl'],
//             price: recipeData['price'].toDouble(),
//           );
//         }).toList();
//         filteredRecipes = List.from(recipes);
//       });
//     } else {
//       print('Failed to fetch recipes. Status code: ${response.statusCode}');
//     }
//   }

//   void filterRecipes(String query) {
//     setState(() {
//       filteredRecipes = recipes
//           .where((recipe) =>
//               recipe.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Food Recipes'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Food Recipes',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     filterRecipes('');
//                   },
//                 ),
//               ),
//               onChanged: (value) {
//                 filterRecipes(value);
//               },
//             ),
//           ),
//           Expanded(
//             child: filteredRecipes.isEmpty
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: filteredRecipes.length,
//                     itemBuilder: (context, index) {
//                       final recipe = filteredRecipes[index];
//                       return GestureDetector(
//                         onTap: () {
//                           _showDescriptionDialog(context, recipe);
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.network(
//                                 recipe.imageUrl,
//                                 height: 150,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       recipe.name,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Text(
//                                       'Price: \$${recipe.price}',
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//                                     SizedBox(height: 10),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Add to cart functionality
//                                       },
//                                       child: Text('Add to Cart'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to the category page
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CategoryPage(baseUrl: widget.baseUrl)),
//           );
//         },
//         child: Icon(Icons.category),
//       ),
//     );
//   }

//   void _showDescriptionDialog(BuildContext context, Recipe recipe) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(recipe.name),
//           content: Text(recipe.description),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'CategoryPage.dart';

// class Recipe {
//   final String name;
//   final String description;
//   final String imageUrl;
//   final double price;

//   Recipe({
//     required this.name,
//     required this.description,
//     required this.imageUrl,
//     required this.price,
//   });
// }

// class FoodRecipesPage extends StatefulWidget {
//   final String baseUrl;
//   final String category;

//   const FoodRecipesPage({Key? key, required this.baseUrl, required this.category}) : super(key: key);

//   @override
//   _FoodRecipesPageState createState() => _FoodRecipesPageState();
// }

// class _FoodRecipesPageState extends State<FoodRecipesPage> {
//   List<Recipe> recipes = [];
//   List<Recipe> filteredRecipes = [];

//   TextEditingController _searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchRecipes();
//   }

//   Future<void> fetchRecipes() async {
//     final response = await http.get(Uri.parse('${widget.baseUrl}/recipes?foodName=${widget.category}'));

//     if (response.statusCode == 200) {
//       final List<dynamic> recipesData = jsonDecode(response.body);
//       setState(() {
//         recipes = recipesData.map((recipeData) {
//           return Recipe(
//             name: recipeData['name'],
//             description: recipeData['description'],
//             imageUrl: recipeData['imageUrl'],
//             price: recipeData['price'].toDouble(),
//           );
//         }).toList();
//         filteredRecipes = List.from(recipes);
//       });
//     } else {
//       print('Failed to fetch recipes. Status code: ${response.statusCode}');
//     }
//   }

//   void filterRecipes(String query) {
//     setState(() {
//       filteredRecipes = recipes
//           .where((recipe) =>
//               recipe.name.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Food Recipes'),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Food Recipes',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.clear),
//                   onPressed: () {
//                     _searchController.clear();
//                     filterRecipes('');
//                   },
//                 ),
//               ),
//               onChanged: (value) {
//                 filterRecipes(value);
//               },
//             ),
//           ),
//           Expanded(
//             child: filteredRecipes.isEmpty
//                 ? Center(
//                     child: CircularProgressIndicator(),
//                   )
//                 : ListView.builder(
//                     itemCount: filteredRecipes.length,
//                     itemBuilder: (context, index) {
//                       final recipe = filteredRecipes[index];
//                       return GestureDetector(
//                         onTap: () {
//                           _showDescriptionDialog(context, recipe);
//                         },
//                         child: Card(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Image.network(
//                                 recipe.imageUrl,
//                                 height: 150,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       recipe.name,
//                                       style: TextStyle(
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 16,
//                                       ),
//                                     ),
//                                     SizedBox(height: 5),
//                                     Text(
//                                       'Price: \$${recipe.price}',
//                                       style: TextStyle(fontSize: 14),
//                                     ),
//                                     SizedBox(height: 10),
//                                     ElevatedButton(
//                                       onPressed: () {
//                                         // Add to cart functionality
//                                       },
//                                       child: Text('Add to Cart'),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to the category page
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => CategoryPage(baseUrl: widget.baseUrl)),
//           );
//         },
//         child: Icon(Icons.category),
//       ),
//     );
//   }

//   void _showDescriptionDialog(BuildContext context, Recipe recipe) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(recipe.name),
//           content: Text(recipe.description),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'CategoryPage.dart';

class Recipe {
  final String name;
  final String description;
  final String imageUrl;
  final double price;

  Recipe({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class FoodRecipesPage extends StatefulWidget {
  final String baseUrl;
  final String category;
  final List<Recipe> recipes;

  const FoodRecipesPage({
    Key? key,
    required this.baseUrl,
    required this.category,
    required this.recipes,
  }) : super(key: key);

  @override
  _FoodRecipesPageState createState() => _FoodRecipesPageState();
}

class _FoodRecipesPageState extends State<FoodRecipesPage> {
  late List<Recipe> filteredRecipes;
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredRecipes = List.from(widget.recipes);
  }

  void filterRecipes(String query) {
    setState(() {
      filteredRecipes = widget.recipes
          .where((recipe) =>
              recipe.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Food Recipes'),
    //   ),
    //   body: Column(
    //     children: [

    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: TextField(
    //           controller: _searchController,
    //           decoration: InputDecoration(
    //             labelText: 'Search Food Recipes',
    //             suffixIcon: IconButton(
    //               icon: Icon(Icons.clear),
    //               onPressed: () {
    //                 _searchController.clear();
    //                 filterRecipes('');
    //               },
    //             ),
    //           ),
    //           onChanged: (value) {
    //             filterRecipes(value);
    //           },
    //         ),
    //       ),
    //       Expanded(
    //         child: filteredRecipes.isEmpty
    //             ? Center(
    //                 child: CircularProgressIndicator(),
    //               )
    //             : ListView.builder(
    //                 itemCount: filteredRecipes.length,
    //                 itemBuilder: (context, index) {
    //                   final recipe = filteredRecipes[index];
    //                   return GestureDetector(
    //                     onTap: () {
    //                       _showDescriptionDialog(context, recipe);
    //                     },
    //                     // child: Card(
    //                     //   child: Column(
    //                     //     crossAxisAlignment: CrossAxisAlignment.start,
    //                     //     children: [
    //                     //       Image.network(
    //                     //         recipe.imageUrl,
    //                     //         height: 150,
    //                     //         width: double.infinity,
    //                     //         fit: BoxFit.cover,
    //                     //       ),
    //                     //       Padding(
    //                     //         padding: const EdgeInsets.all(8.0),
    //                     //         child: Column(
    //                     //           crossAxisAlignment: CrossAxisAlignment.start,
    //                     //           children: [
    //                     //             Text(
    //                     //               recipe.name,
    //                     //               style: TextStyle(
    //                     //                 fontWeight: FontWeight.bold,
    //                     //                 fontSize: 16,
    //                     //               ),
    //                     //             ),
    //                     //             SizedBox(height: 5),
    //                     //             Text(
    //                     //               'Price: \$${recipe.price}',
    //                     //               style: TextStyle(fontSize: 14),
    //                     //             ),
    //                     //             SizedBox(height: 10),
    //                     //             ElevatedButton(
    //                     //               onPressed: () {
    //                     //                 // Add to cart functionality
    //                     //               },
    //                     //               child: Text('Add to Cart'),
    //                     //             ),
    //                     //           ],
    //                     //         ),
    //                     //       ),
    //                     //     ],
    //                     //   ),
    //                     // ),

    //                     child: Card(
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Image.network(
    //                             recipe.imageUrl,
    //                             height: 150,
    //                             width: double.infinity,
    //                             fit: BoxFit.cover,
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.all(8.0),
    //                             child: Column(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Text(
    //                                   recipe.name,
    //                                   style: TextStyle(
    //                                     fontWeight: FontWeight.bold,
    //                                     fontSize: 16,
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: 5),
    //                                 Text(
    //                                   'Price: \$${recipe.price}',
    //                                   style: TextStyle(fontSize: 14),
    //                                 ),
    //                                 SizedBox(height: 10),
    //                                 Row(
    //                                   mainAxisAlignment:
    //                                       MainAxisAlignment.spaceBetween,
    //                                   children: [
    //                                     ElevatedButton(
    //                                       onPressed: () {
    //                                         _getCalories(context, recipe);
    //                                       },
    //                                       child: Text('Nutrition Data'),
    //                                     ),
    //                                     ElevatedButton(
    //                                       onPressed: () {
    //                                         // Add to cart functionality
    //                                       },
    //                                       child: Text('Add to Cart'),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //       ),
    //     ],
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text('Food Recipes',style: TextStyle(color: Colors.blue[800],fontWeight: FontWeight.bold),),
        // actions: [
        //   IconButton(
        //     onPressed: () {},
        //     icon: Icon(Icons.menu),
        //     iconSize: 40,
        //     color: Colors.blue[800],
        //   ),
        // ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 40,
          color: Colors.blue[800],
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Food Recipes',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    filterRecipes('');
                  },
                ),
              ),
              onChanged: (value) {
                filterRecipes(value);
              },
            ),
          ),
          Expanded(
            child: filteredRecipes.isEmpty
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: filteredRecipes.length,
                    itemBuilder: (context, index) {
                      final recipe = filteredRecipes[index];
                      return GestureDetector(
                        onTap: () {
                          _showDescriptionDialog(context, recipe);
                        },
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                recipe.imageUrl,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      recipe.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      'Price: \$${recipe.price}',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            _getCalories(context, recipe);
                                          },
                                          child: Text('Nutrition Data'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            // Add to cart functionality
                                          },
                                          child: Text('Add to Cart'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showDescriptionDialog(BuildContext context, Recipe recipe) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(recipe.name),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(recipe.description),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     _getCalories(context, recipe);
                    //   },
                    //   child: Text('Nutrition Data'),
                    // ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _getCalories(BuildContext context, Recipe recipe) async {
    try {
      final response = await http
          .get(Uri.parse('${widget.baseUrl}/nutrition?query=${recipe.name}'));
      if (response.statusCode == 200) {
        // Parse the response and extract the calorie information
        final List<dynamic> dataList = jsonDecode(response.body);
        if (dataList.isNotEmpty) {
          final List<Widget> nutritionalInfoWidgets = dataList.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${data['name']}'),
                Text('Calories: ${data['calories']}'),
                Text('Serving Size: ${data['serving_size_g']}g'),
                Text('Total Fat: ${data['fat_total_g']}g'),
                Text('Saturated Fat: ${data['fat_saturated_g']}g'),
                Text('Protein: ${data['protein_g']}g'),
                Text('Sodium: ${data['sodium_mg']}mg'),
                Text('Potassium: ${data['potassium_mg']}mg'),
                Text('Cholesterol: ${data['cholesterol_mg']}mg'),
                Text('Total Carbohydrates: ${data['carbohydrates_total_g']}g'),
                Text('Fiber: ${data['fiber_g']}g'),
                Text('Sugar: ${data['sugar_g']}g'),
                SizedBox(height: 20),
              ],
            );
          }).toList();

          // Show a dialog with the nutritional information
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Nutrition Data'),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: nutritionalInfoWidgets,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          print('No data found');
        }
      } else {
        // Handle error response
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network error
      print('Error: $error');
    }
  }
}
