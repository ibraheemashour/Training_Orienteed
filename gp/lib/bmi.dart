import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BMIPage extends StatefulWidget {
  final String baseUrl;
  const BMIPage({Key? key, required this.baseUrl}) : super(key: key);
  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0;
  String message = '';

  Future<void> calculateBMI() async {
    if (_validateInputs()) {
      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text) / 100; // convert height to meters

      final response = await http.post(
        Uri.parse('${widget.baseUrl}/calculateBMI'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'weight': weight,
          'height': height,
        }),
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          bmiResult = jsonResponse['bmi'];
          message = jsonResponse['message'];
        });
      } else {
        setState(() {
          message = 'Failed to calculate BMI';
        });
      }
    } else {
      _showAlertDialog('Please fill in all fields.');
    }
  }

  bool _validateInputs() {
    return weightController.text.isNotEmpty && heightController.text.isNotEmpty;
  }

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
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
        title: Text('BMI Calculator',style: TextStyle(
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
      body: Padding(        
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Height (cm)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              'BMI: ${bmiResult.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
