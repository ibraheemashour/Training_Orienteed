// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'signupPage.dart'; // Import the SignupPage widget
// import 'home.dart';

// class LoginPage extends StatefulWidget {
//   final String baseUrl;

  

//   const LoginPage({Key? key, required this.baseUrl}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();

//   Future<void> _login() async {
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//     print('Email: $email, Password: $password');
    
 


//     try {
//       var url = Uri.parse('${widget.baseUrl}/login');
//       var response = await http.post(
//         url,
//         body: jsonEncode({'email': email, 'password': password}),
//         headers: {'Content-Type': 'application/json'},
//       );

//       if (response.statusCode == 200) {
//         // Login successful
//         print('Login successful!');  
//         var responseData = json.decode(response.body);
//         String userName = responseData['user_name'];
//          Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage(baseUrl: widget.baseUrl,name:userName,email: email,password:password,)), // Navigate to HomePage after successful login
//         );
//         // Navigate to next screen or do something else
//       } else {
//         // Login failed
     

//         // print('Login failed with status code: ${response.statusCode}');
//         // print('Response body: ${response.body}');

   
//       print('Login failed with status code: ${response.statusCode}');
//       print('Response body: ${response.body}');

//       showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Text("Error"),
//             content: Text("Incorrect Email or Password."),
//             actions: <Widget>[
//               TextButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text("OK"),
//               ),
//             ],
//           );
//         },
//       );



//       }
//     } catch (error) {
//       // Handle error
//       print('Error: $error');
//     }
//   }

//   // Method to navigate to the signup page
//   void _goToSignupPage() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
             

//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//                 ),
//               keyboardType: TextInputType.emailAddress,
              
//             ),
//              SizedBox(height: 10.0),
//             TextField(
//               controller: _passwordController,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//                 ),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login',  style: TextStyle(fontSize: 25.0, color: Colors.blue[800])),
//             ),
//             SizedBox(height: 10.0),
//             // Text("Don't have an account?", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.blue[800])), // Add some space between buttons
//             // TextButton(
//             //   onPressed: _goToSignupPage,
//             //   child: Text('Sign Up'),
//             // ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center, // Align children in the center horizontally
//               children: [
//                 Text(
//                   "Don't have an account ?",
//                   style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue[800]),
//                 ),
//                 TextButton(
//                   onPressed: _goToSignupPage,
//                   child: Text('Sign Up',style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.blue[400])),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:gp/signupPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart'; // Import for jsonEncode

class LoginPage extends StatefulWidget {
  // static const String screenRoute = 'signin_page';
   final String baseUrl;
  //const signinPage({super.key});
const LoginPage({Key? key, required this.baseUrl}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // for toggling password visibility
  
  

  
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
  

 Future<void> signIn() async {
  String email= emailController.text.trim();
  String password = passwordController.text.trim();
  
  try {
    var url = Uri.parse('${widget.baseUrl}/login');
    var response = await http.post(
      url,
      body: jsonEncode({'email': email, 'password': password}),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Sign in successful
      print('Sign in successful!');
      var responseData = json.decode(response.body);
      String userName = responseData['user_name'];
      Navigator.push(
        context,
        // MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
        MaterialPageRoute(builder: (context) => HomePage(baseUrl: widget.baseUrl,name:userName,email: email,password:password,))
      );
      // Navigate to another page or perform actions upon successful sign-in
    } else {
      // Sign in failed

      print('Sign in failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("Incorrect Username or Password."),
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
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 202, 248, 202)],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipPath(
                clipper: WaveClipper(),
                child: Image.asset(
                  'images/img1.jpg', // Replace 'images/img1.jpg' with your image path
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 5),
              Column(
                children: [
                  Container(
                    width: 280,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                        image: AssetImage('images/img5.png'), // Adjust image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 91, 169, 233),
                        ),
                        child: AnimatedTextKit(
                           totalRepeatCount:10,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Diet Wizard',
                              speed: Duration(milliseconds: 500), // Adjust speed to 5 seconds
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Login To Your Account',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: passwordController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                        onPressed: () {

                        setState(() {
                          _obscureText = !_obscureText;
                        });
                          },
                        ),
                      ),
                      
                    ),
                    SizedBox(height: 10),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        // Add forgot password functionality here
                        //  Navigator.pushNamed(context, chatScreen.screenRoute);
                      },
                      child: Text(
                        'Forgot Password?-Chat Test',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 235, 64, 21), // Change to your desired color
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Add login functionality here
                        signIn();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 190, 235, 68)), // background color
                        elevation: MaterialStateProperty.all<double>(5), // shadow elevation
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(horizontal: 45, vertical: 15), // button padding
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30), // button border radius
                          ),
                        ),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white, // text color
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Color for the first part of the text
                          ),
                        ),
                        SizedBox(width: 7),
                        InkWell(
                          onTap: () {
                        Navigator.pushReplacement(
                          context,
                           MaterialPageRoute(builder: (context) => SignupPage(baseUrl: widget.baseUrl)),
                          );
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.red, // Color for the word "SignUp!!"
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.8);

    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.75, size.height * 0.6);
    var secondEndPoint = Offset(size.width, size.height * 0.8);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}