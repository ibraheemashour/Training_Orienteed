// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class ImageUploadScreen extends StatefulWidget {
//   final String baseUrl;
//   const ImageUploadScreen({Key? key, required this.baseUrl}) : super(key: key);
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }

// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   File? _image;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       final url = Uri.parse('http://192.168.1.126:3000/addproduct');
//       final request = http.MultipartRequest('POST', url);
//       request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
//       request.fields['nameproduct'] = _nameController.text;
//       request.fields['priceproduct'] = _priceController.text;

//       try {
//         final streamedResponse = await request.send();
//         final response = await http.Response.fromStream(streamedResponse);
        
//         if (response.statusCode == 200) {
//           print('Image uploaded successfully');
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Image Upload'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
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
//         ),
//       ),
//     );
//   }
// }
/////////////////////
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// class ImageUploadScreen extends StatefulWidget {
//   final String baseUrl;
//   const ImageUploadScreen({Key? key, required this.baseUrl}) : super(key: key);
//   @override
//   _ImageUploadScreenState createState() => _ImageUploadScreenState();
// }

// class _ImageUploadScreenState extends State<ImageUploadScreen> {
//   File? _image;
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _priceController = TextEditingController();

//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.getImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }

//   Future<void> _uploadImage() async {
//     if (_image != null) {
//       final url = Uri.parse('http://192.168.1.126:3000/addproduct');
//       final request = http.MultipartRequest('POST', url);
//       request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
//       request.fields['nameproduct'] = _nameController.text;
//       request.fields['priceproduct'] = _priceController.text;

//       try {
//         final streamedResponse = await request.send();
//         final response = await http.Response.fromStream(streamedResponse);
        
//         if (response.statusCode == 200) {
//           print('Image uploaded successfully');
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
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Image Upload'),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           _image == null
//               ? Text('No image selected.')
//               : Container(
//                   height: 100,
//                   child: Image.file(_image!, height: 100),
//                 ),
//           ElevatedButton(
//             onPressed: _getImage,
//             child: Text('Select Image'),
//           ),
//           TextField(
//             controller: _nameController,
//             decoration: InputDecoration(
//               labelText: 'Name',
//             ),
//           ),
//           TextField(
//             controller: _priceController,
//             keyboardType: TextInputType.number,
//             decoration: InputDecoration(
//               labelText: 'Price',
//             ),
//           ),
//           ElevatedButton(
//             onPressed: _uploadImage,
//             child: Text('Upload Image'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
///////////////////////
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageUploadScreen extends StatefulWidget {
  final String baseUrl;
  const ImageUploadScreen({Key? key, required this.baseUrl}) : super(key: key);
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _image;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _uploadImage() async {
    if (_image != null) {
      final url = Uri.parse('${widget.baseUrl}/addproduct');
      final request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('image', _image!.path));
      request.fields['nameproduct'] = _nameController.text;
      request.fields['priceproduct'] = _priceController.text;

      try {
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);
        
        if (response.statusCode == 200) {
          print('Image uploaded successfully');
          _showSuccessDialog();
        } else {
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else {
      print('No image selected');
    }
  }

void _showSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Product Added Successfully'),
        content: Text('Your product has been added successfully.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              setState(() {
                _image = null;
                _nameController.clear();
                _priceController.clear();
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
        title: Text('Image Upload',style: TextStyle(
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Container(
                    height: 100,
                    child: Image.file(_image!, height: 100),
                  ),
            ElevatedButton(
              onPressed: _getImage,
              child: Text('Select Image'),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
              ),
            ),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}
