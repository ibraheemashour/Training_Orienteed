import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'loginPage.dart'; // Import the LoginPage widget

class SignupPage extends StatefulWidget {
  final String baseUrl;

  const SignupPage({Key? key, required this.baseUrl}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();


  Future<void> _signup() async {
    String username = _usernameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String firstname = _firstnameController.text.trim();
    String lastname = _lastnameController.text.trim();

    try {
      var url = Uri.parse('${widget.baseUrl}/signup');
      var response = await http.post(
        url,
        body: jsonEncode({'username': username, 'email': email, 'password': password, 'firstname': firstname, 'lastname': lastname}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Signup successful
        print('Signup successful!');
        // Navigate to login page
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(baseUrl: widget.baseUrl)),
        );
      } else {
        // Signup failed
        print('Signup failed with status code: ${response.statusCode}');
        print('Response body: ${response.body}');

        showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error",style: TextStyle(color: Colors.red),),
            content: Text("${response.body}",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );


      }
    } catch (error) {
      // Handle error
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'User Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.verified_user_rounded),
                ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _firstnameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _lastnameController,
              decoration: InputDecoration(
                labelText: 'Second Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
                ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
                ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _signup,
              child: Text('Signup',  style: TextStyle(fontSize: 25.0, color: Colors.blue[800])),
            ),
          ],
        ),
      ),
    );
  }
}
