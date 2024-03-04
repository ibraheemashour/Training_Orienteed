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
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100; // convert height to meters
    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi;
    });

    final response = await http.post(
      Uri.parse('${widget.baseUrl}/fetch'),
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
          message = jsonResponse['message'];
        });
      } else {
        setState(() {
          // message = 'Failed to load BMI data';
        });
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
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
