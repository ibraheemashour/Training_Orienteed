// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:gp/loginPage.dart';
// import 'package:gp/market.dart';
// import 'package:gp/profile.dart';

// class HomePage extends StatefulWidget {
//   final String baseUrl;
//   final String name;
//   final String email;
//   final String password;

//   const HomePage(
//       {Key? key,
//       required this.baseUrl,
//       required this.name,
//       required this.email,
//       required this.password})
//       : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hello"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.comment),
//             tooltip: 'Comment Icon',
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             tooltip: 'Setting Icon',
//             onPressed: () {},
//           ),
//         ],
//         backgroundColor: Colors.blue,
//         elevation: 50.0,
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//       ),
//       // body: Center(
//       //   child:Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,
//       //      children: [
//       //         // Text(
//       //         //   'Welcome',
//       //         //   style: TextStyle(fontSize: 30, color: Colors.blue),
//       //         // ),
//       //         child: Container(
//       //       width: 200,
//       //       height: 200,
//       //       decoration: BoxDecoration(
//       //         color: Colors.blue, // You can set background color for the container
//       //         borderRadius: BorderRadius.circular(10), // You can set border radius for rounded corners
//       //       ),
//       //       child: Image.network(
//       //         'https://example.com/your-image.jpg', // Replace this URL with your image URL
//       //         fit: BoxFit.cover, // You can adjust the fit of the image
//       //       ),
//       //         SizedBox(height: 20), // Add some space between text and button
//       //         ElevatedButton(
//       //           onPressed: () {
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => Market(baseUrl: widget.baseUrl)),
//       //           );
//       //           },
//       //           child: Text('Marketplace',style: TextStyle(fontSize: 20, color: Colors.blue)),
//       //         ),
//       //       ],
//       //   ),

//       // ),
//       //       body: Center(
//       //   child: Column(
//       //     mainAxisAlignment: MainAxisAlignment.center,

//       //     children: [
//       //       Container(
//       //         width: 200,
//       //         height: 200,
//       //         decoration: BoxDecoration(
//       //           color: Colors.blue, // You can set background color for the container
//       //           borderRadius: BorderRadius.circular(50), // You can set border radius for rounded corners

//       //         ),
//       //         child: Image.network(
//       //           'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', // Replace this URL with your image URL
//       //           fit: BoxFit.cover, // You can adjust the fit of the image
//       //         ),
//       //       ),
//       //       SizedBox(height: 20), // Add some space between image and button
//       //       ElevatedButton(
//       //         onPressed: () {
//       //           Navigator.push(
//       //             context,
//       //             MaterialPageRoute(builder: (context) => Market(baseUrl: widget.baseUrl)),
//       //           );
//       //         },
//       //         child: Text('Marketplace', style: TextStyle(fontSize: 20, color: Colors.blue)),
//       //       ),
//       //     ],
//       //   ),
//       // ),
//       body: ListView(
//         children: [
//           SizedBox(height: 20), // Add some space between app bar and image
//           Center(
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors
//                     .blue, // You can set background color for the container
//                 borderRadius: BorderRadius.circular(
//                     100), // You can set border radius for rounded corners
//               ),
//               child: Image.network(
//                 'https://www.planetware.com/wpimages/2020/02/france-in-pictures-beautiful-places-to-photograph-eiffel-tower.jpg', // Replace this URL with your image URL
//                 fit: BoxFit.cover, // You can adjust the fit of the image
//               ),
//             ),
//           ),
//           SizedBox(height: 20), // Add some space between image and button
//           ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Market(baseUrl: widget.baseUrl)),
//               );
//             },
//             child: Text('Marketplace',
//                 style: TextStyle(fontSize: 20, color: Colors.blue)),
//           ),
//         ],
//       ),
 


// floatingActionButton: FloatingActionButton(
//   onPressed: () {},
//   backgroundColor: Colors.blue,
//   foregroundColor: Colors.white,
//   elevation: 4.0,
//   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
//   child: PopupMenuButton(
//     child: Icon(Icons.add),
//     itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//       PopupMenuItem(
//         child: ListTile(
//           leading: Icon(Icons.home),
//           title: Text('Home'),
//         ),
//         value: 'home',
//       ),
//       PopupMenuItem(
//         child: ListTile(
//           leading: Icon(Icons.person),
//           title: Text('Profile'),
//         ),
//         value: 'profile',
//       ),
//       PopupMenuItem(
//         child: ListTile(
//           leading: Icon(Icons.shopping_cart),
//           title: Text('Market'),
//         ),
//         value: 'market',
//       ),
//     ],
//     onSelected: (value) {
//       switch (value) {
//         case 'home':
//           // Navigate to home page
//           break;
//         case 'profile':
//           // Navigate to profile page
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ProfilePage(
//                 baseUrl: widget.baseUrl,
//                 name: widget.name,
//                 email: widget.email,
//                 password: widget.password,
//               ),
//             ),
//           );
//           break;
//         case 'market':
//           // Navigate to market page
//             Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                     builder: (context) => Market(baseUrl: widget.baseUrl)),
//               );
//           break;
//       }
//     },
//   ),
// ),





//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         fixedColor: const Color.fromARGB(255, 13, 105, 151),
//         items: const [
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: "Search",
//             icon: Icon(Icons.search),
//           ),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: Icon(Icons.account_circle),
//           ),
//         ],
//         onTap: (int indexOfItem) {
//           // print(indexOfItem);
//           // Handle navigation
//           if (indexOfItem == 0) {
//             print('Home');
//           }
//           if (indexOfItem == 1) {
//             print('Search');
//           }
//           if (indexOfItem == 2) {
//             print('Profile');
//             //go to profile
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => ProfilePage(
//                       baseUrl: widget.baseUrl,
//                       name: widget.name,
//                       email: widget.email,
//                       password: widget.password)),
//             );
//           }
//         },
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: const EdgeInsets.all(0),
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(widget.name),
//               accountEmail: Text(widget.email),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.lightBlue,
//                 child: Text(
//                   widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
//                   style: TextStyle(fontSize: 25.0, color: Colors.white),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.book),
//               title: const Text(' My Course '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.workspace_premium),
//               title: const Text(' Go Premium '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.video_label),
//               title: const Text(' Saved Videos '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.edit),
//               title: const Text(' Edit Profile '),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => ProfilePage(
//                           baseUrl: widget.baseUrl,
//                           name: widget.name,
//                           email: widget.email,
//                           password: widget.password)),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('LogOut'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => LoginPage(baseUrl: widget.baseUrl)),
//                 );
//                 print('logout successful!');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

 
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// import 'loginPage.dart';
// import 'market.dart';
// import 'profile.dart';

// class HomePage extends StatefulWidget {
//   final String baseUrl;
//   final String name;
//   final String email;
//   final String password;

//   const HomePage({
//     Key? key,
//     required this.baseUrl,
//     required this.name,
//     required this.email,
//     required this.password,
//   }) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _contentController = TextEditingController();
//   File? _image;

//   Future<void> _pickImageFromGallery() async {
//     // final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
//     // if (pickedImage != null) {
//     //   setState(() {
//     //     _image = File(pickedImage.path);
//     //   });
//     // }



//       final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });




//   }

 










//   // Future<void> _addPost() async {
//   //   try {
//   //     var request = http.MultipartRequest('POST', Uri.parse('${widget.baseUrl}/posts'));
//   //     request.fields['title'] = _titleController.text;
//   //     request.fields['content'] = _contentController.text;
//   //     request.files.add(await http.MultipartFile.fromPath('image', _image.path));

//   //     var response = await request.send();
//   //     if (response.statusCode == 200) {
//   //       // Post added successfully
//   //       print('Post added successfully');
//   //       // Clear form fields and image
//   //       _titleController.clear();
//   //       _contentController.clear();
//   //       setState(() {
//   //         _image = File(''); // Clear image
//   //       });
//   //     } else {
//   //       // Error adding post
//   //       print('Error adding post: ${response.reasonPhrase}');
//   //     }
//   //   } catch (error) {
//   //     print('Error adding post: $error');
//   //   }
//   // }



//     Future<void> _addPost() async {
//     if (_image != null) {
//       final url = Uri.parse('${widget.baseUrl}/posts');
//       final request = http.MultipartRequest('POST', url);
//       request.files.add(await http.MultipartFile.fromPath('image', _image!.path));


//        request.fields['title'] = _titleController.text;
//       request.fields['content'] = _contentController.text;

//       try {
//         final streamedResponse = await request.send();
//         final response = await http.Response.fromStream(streamedResponse);
        
//         if (response.statusCode == 200) {
//           print('Image uploaded successfully');
//           _showSuccessDialog();
//         } else {
//           print('Failed to upload image. Status code: ${response.statusCode}');
//         }
//       } catch (e) {
//         print('Error uploading image: $e');
//       }
//     } else {
//       print('No image selected');
//     }
//   }

// void _showSuccessDialog() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Product Added Successfully'),
//         content: Text('Your product has been added successfully.'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               setState(() {
//                 _image = null;
//                 _titleController.clear();
//                 _contentController.clear();
//               });
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }












//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Hello"),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(Icons.comment),
//             tooltip: 'Comment Icon',
//             onPressed: () {},
//           ),
//           IconButton(
//             icon: const Icon(Icons.settings),
//             tooltip: 'Setting Icon',
//             onPressed: () {},
//           ),
//         ],
//         backgroundColor: Colors.blue,
//         elevation: 50.0,
//         systemOverlayStyle: SystemUiOverlayStyle.light,
//       ),
//       body: ListView(
//         children: [
//           SizedBox(height: 20), // Add some space between app bar and image
//           Center(
//             child: Container(
//               width: 200,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.blue, // You can set background color for the container
//                 borderRadius: BorderRadius.circular(100), // You can set border radius for rounded corners
//               ),
//               // child: _image != null
//               //     ? Image.file(
//               //         _image,
//               //         fit: BoxFit.cover, // You can adjust the fit of the image
//               //       )
//                   // : Placeholder(fallbackHeight: 200),
//                   children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Container(
//                     height: 100,
//                     child: Image.file(_image!, height: 100),
//                   ),
//             ElevatedButton(
//               onPressed: _getImage,
//               child: Text('Select Image'),
//             ),
//             TextField(
//               controller: _nameController,
//               decoration: InputDecoration(
//                 labelText: 'Name',
//               ),
//             ),
//             TextField(
//               controller: _priceController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Price',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _uploadImage,
//               child: Text('Upload Image'),
//             ),
//           ],
//             ),
//           ),
//           SizedBox(height: 20), // Add some space between image and button
//           ElevatedButton(
//             onPressed: _pickImageFromGallery,
//             child: Text('Select Image'),
//           ),
//           SizedBox(height: 20), // Add some space between button and text fields
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextField(
//               controller: _titleController,
//               decoration: InputDecoration(
//                 labelText: 'Title',
//               ),
//             ),
//           ),
//           SizedBox(height: 20), // Add some space between title field and content field
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextField(
//               controller: _contentController,
//               decoration: InputDecoration(
//                 labelText: 'Content',
//               ),
//             ),
//           ),
//           SizedBox(height: 20), // Add some space between content field and button
//           ElevatedButton(
//             onPressed: _addPost,
//             child: Text('Add Post'),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.blue,
//         foregroundColor: Colors.white,
//         elevation: 4.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         child: PopupMenuButton(
//           child: Icon(Icons.add),
//           itemBuilder: (BuildContext context) => <PopupMenuEntry>[
//             PopupMenuItem(
//               child: ListTile(
//                 leading: Icon(Icons.home),
//                 title: Text('Home'),
//               ),
//               value: 'home',
//             ),
//             PopupMenuItem(
//               child: ListTile(
//                 leading: Icon(Icons.person),
//                 title: Text('Profile'),
//               ),
//               value: 'profile',
//             ),
//             PopupMenuItem(
//               child: ListTile(
//                 leading: Icon(Icons.shopping_cart),
//                 title: Text('Market'),
//               ),
//               value: 'market',
//             ),
//           ],
//           onSelected: (value) {
//             switch (value) {
//               case 'home':
//                 // Navigate to home page
//                 break;
//               case 'profile':
//                 // Navigate to profile page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProfilePage(
//                       baseUrl: widget.baseUrl,
//                       name: widget.name,
//                       email: widget.email,
//                       password: widget.password,
//                     ),
//                   ),
//                 );
//                 break;
//               case 'market':
//                 // Navigate to market page
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Market(baseUrl: widget.baseUrl),
//                   ),
//                 );
//                 break;
//             }
//           },
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         fixedColor: const Color.fromARGB(255, 13, 105, 151),
//         items: const [
//           BottomNavigationBarItem(
//             label: "Home",
//             icon: Icon(Icons.home),
//           ),
//           BottomNavigationBarItem(
//             label: "Search",
//             icon: Icon(Icons.search),
//           ),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: Icon(Icons.account_circle),
//           ),
//         ],
//         onTap: (int indexOfItem) {
//           // Handle navigation
//           if (indexOfItem == 0) {
//             print('Home');
//           }
//           if (indexOfItem == 1) {
//             print('Search');
//           }
//           if (indexOfItem == 2) {
//             print('Profile');
//             // Go to profile
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ProfilePage(
//                   baseUrl: widget.baseUrl,
//                   name: widget.name,
//                   email: widget.email,
//                   password: widget.password,
//                 ),
//               ),
//             );
//           }
//         },
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: const EdgeInsets.all(0),
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(widget.name),
//               accountEmail: Text(widget.email),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.lightBlue,
//                 child: Text(
//                   widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
//                   style: TextStyle(fontSize: 25.0, color: Colors.white),
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.book),
//               title: const Text(' My Course '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.workspace_premium),
//               title: const Text(' Go Premium '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.video_label),
//               title: const Text(' Saved Videos '),
//               onTap: () {
//                 Navigator.pop(context);
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.edit),
//               title: const Text(' Edit Profile '),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProfilePage(
//                       baseUrl: widget.baseUrl,
//                       name: widget.name,
//                       email: widget.email,
//                       password: widget.password,
//                     ),
//                   ),
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('LogOut'),
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         LoginPage(baseUrl: widget.baseUrl),
//                   ),
//                 );
//                 print('logout successful!');
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'loginPage.dart';
import 'market.dart';
import 'profile.dart';
import 'showposts.dart';

class HomePage extends StatefulWidget {
  final String baseUrl;
  final String name;
  final String email;
  final String password;

  const HomePage({
    Key? key,
    required this.baseUrl,
    required this.name,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();
  File? _image;

  Future<void> _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  // Future<void> _addPost() async {
  //   if (_image != null) {
  //     final url = Uri.parse('${widget.baseUrl}/posts');
  //     final request = http.MultipartRequest('POST', url);
  //     request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
  //     request.fields['title'] = _titleController.text;
  //     request.fields['content'] = _contentController.text;

  //     try {
  //       final streamedResponse = await request.send();
  //       final response = await http.Response.fromStream(streamedResponse);
        
  //       if (response.statusCode == 200) {
  //         print('Post added successfully');
  //         _showSuccessDialog();
  //       } else {
  //         print('Failed to add post. Status code: ${response.statusCode}');
  //       }
  //     } catch (e) {
  //       print('Error adding post: $e');
  //     }
  //   } else {
  //     print('No image selected');
  //   }
  // }
  Future<void> _addPost() async {
  final url = Uri.parse('${widget.baseUrl}/posts');
  final request = http.MultipartRequest('POST', url);

  // Add image if selected
  if (_image != null) {
    request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
  }

  // Add title and content
  request.fields['title'] = _titleController.text;
  request.fields['content'] = _contentController.text;
  request.fields['name'] = widget.name;

  try {
    final streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);
    
    if (response.statusCode == 200) {
      print('Post added successfully');
      _showSuccessDialog();
    } else {
      print('Failed to add post. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error adding post: $e');
  }
}


  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Post Added Successfully'),
          content: Text('Your post has been added successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _image = null;
                  _titleController.clear();
                  _contentController.clear();
                });
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.comment),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Setting Icon',
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.blue,
        elevation: 50.0,
        // systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          SizedBox(height: 20),
          _image == null
              ? ElevatedButton(
                  onPressed: _pickImageFromGallery,
                  child: Text('Select Image'),
                )
              : Image.file(_image!),
          SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: _contentController,
            decoration: InputDecoration(
              labelText: 'Content',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _addPost,
            child: Text('Add Post'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostShow(baseUrl: widget.baseUrl, username: widget.name,)),
              );
              
            },
            child: Text('Show Posts'),
          ),
          
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: PopupMenuButton(
          child: Icon(Icons.add),
          itemBuilder: (BuildContext context) => <PopupMenuEntry>[
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              value: 'home',
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
              ),
              value: 'profile',
            ),
            PopupMenuItem(
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Market'),
              ),
              value: 'market',
            ),
          ],
          onSelected: (value) {
            switch (value) {
              case 'home':
                // Navigate to home page
                break;
              case 'profile':
                // Navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      baseUrl: widget.baseUrl,
                      name: widget.name,
                      email: widget.email,
                      password: widget.password,
                    ),
                  ),
                );
                break;
              case 'market':
                // Navigate to market page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Market(baseUrl: widget.baseUrl),
                  ),
                );
                break;
            }
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: const Color.fromARGB(255, 13, 105, 151),
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.account_circle),
          ),
        ],
        onTap: (int indexOfItem) {
          // Handle navigation
          if (indexOfItem == 0) {
            print('Home');
          }
          if (indexOfItem == 1) {
            print('Search');
          }
          if (indexOfItem == 2) {
            print('Profile');
            // Go to profile
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  baseUrl: widget.baseUrl,
                  name: widget.name,
                  email: widget.email,
                  password: widget.password,
                ),
              ),
            );
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.name),
              accountEmail: Text(widget.email),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                child: Text(
                  widget.name.isNotEmpty ? widget.name[0].toUpperCase() : '',
                  style: TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.book),
              title: const Text(' My Course '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium),
              title: const Text(' Go Premium '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_label),
              title: const Text(' Saved Videos '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      baseUrl: widget.baseUrl,
                      name: widget.name,
                      email: widget.email,
                      password: widget.password,
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        LoginPage(baseUrl: widget.baseUrl),
                  ),
                );
                print('logout successful!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
 