import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'signupPage.dart'; // Import the SignupPage widget
import 'home.dart';

class LoginPage extends StatefulWidget {
  final String baseUrl;

  

  const LoginPage({Key? key, required this.baseUrl}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    print('Email: $email, Password: $password');
    
 


    try {
      var url = Uri.parse('${widget.baseUrl}/login');
      var response = await http.post(
        url,
        body: jsonEncode({'email': email, 'password': password}),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Login successful
        print('Login successful!');  
        var responseData = json.decode(response.body);
        String userName = responseData['user_name'];
         Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage(baseUrl: widget.baseUrl,name:userName,email: email,password:password,)), // Navigate to HomePage after successful login
        );
        // Navigate to next screen or do something else
      } else {
        // Login failed
     

        // print('Login failed with status code: ${response.statusCode}');
        // print('Response body: ${response.body}');

   
      print('Login failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Incorrect Email or Password."),
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

  // Method to navigate to the signup page
  void _goToSignupPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             

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
              onPressed: _login,
              child: Text('Login',  style: TextStyle(fontSize: 25.0, color: Colors.blue[800])),
            ),
            SizedBox(height: 10.0),
            // Text("Don't have an account?", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blue[800])), // Add some space between buttons
            // TextButton(
            //   onPressed: _goToSignupPage,
            //   child: Text('Sign Up'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Align children in the center horizontally
              children: [
                Text(
                  "Don't have an account ?",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue[800]),
                ),
                TextButton(
                  onPressed: _goToSignupPage,
                  child: Text('Sign Up',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue[400])),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
