import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum Gender { male, female }

class BfpCalculator extends StatefulWidget {
  final String baseUrl;
  const BfpCalculator({Key? key, required this.baseUrl}) : super(key: key);

  @override
  _BfpCalculatorState createState() => _BfpCalculatorState();
}

class _BfpCalculatorState extends State<BfpCalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Gender? _selectedGender; // Make the selected gender nullable

  String bfp = '';
  String fatMass = '';
  String leanMass = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BFP Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text('Male'),
                    leading: Radio(
                      value: Gender.male,
                      groupValue: _selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    title: Text('Female'),
                    leading: Radio(
                      value: Gender.female,
                      groupValue: _selectedGender,
                      onChanged: (Gender? value) {
                        setState(() {
                          _selectedGender = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_validateInputs()) {
                  calculateBfp();
                } else {
                  _showAlertDialog('Please fill in all fields and select gender.');
                }
              },
              child: Text('Calculate'),
            ),
            SizedBox(height: 16.0),
            Text('BFP: $bfp'),
            Text('Fat Mass: $fatMass'),
            Text('Lean Mass: $leanMass'),
            Text('Description: $description'),
          ],
        ),
      ),
    );
  }

  bool _validateInputs() {
    return weightController.text.isNotEmpty &&
        heightController.text.isNotEmpty &&
        ageController.text.isNotEmpty &&
        _selectedGender != null;
  }

  Future<void> calculateBfp() async {
    double weight = double.tryParse(weightController.text) ?? 0;
    double height = double.tryParse(heightController.text) ?? 0;
    int age = int.tryParse(ageController.text) ?? 0;
    String gender = _selectedGender == Gender.male ? 'male' : 'female';

    String url = '${widget.baseUrl}/calculateBFP';

    Map<String, dynamic> requestBody = {
      'weight': weight.toString(),
      'height': height.toString(),
      'age': age.toString(),
      'gender': gender,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(requestBody),
    );

    if (response.statusCode == 200) {
      setState(() {
        var data = json.decode(response.body);
        bfp = data['bfp'].toString();
        fatMass = data['fat_mass'].toString();
        leanMass = data['lean_mass'].toString();
        description = data['description'].toString();
      });
      print('Response BFP: $bfp'); // Add this line to print BFP value from response
    } else {
      throw Exception('Failed to load data');
    }
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
}
