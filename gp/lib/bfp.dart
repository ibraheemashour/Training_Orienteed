import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:awesome_dialog/awesome_dialog.dart';

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
        title: Text(
          'BFP Calculator',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blue[800],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          iconSize: 40,
          color: Colors.blue[800],
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        // Add SingleChildScrollView here
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://www.fittr.com/assets/images/og/body-fat-calculator-og.jpg',
                width: 150,
                height: 180,
              ),
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
                    _showAlertDialog(
                        'Please fill in all fields and select gender.');
                  }
                },
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text('BFP: $bfp', style: TextStyle(fontSize: 20.0)),
              Text('Fat Mass: $fatMass', style: TextStyle(fontSize: 20.0)),
              Text('Lean Mass: $leanMass', style: TextStyle(fontSize: 20.0)),
              Text('Description: $description',
                  style: TextStyle(fontSize: 20.0)),
            ],
          ),
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
      print(
          'Response BFP: $bfp'); // Add this line to print BFP value from response
    } else {
      throw Exception('Failed to load data');
    }
  }

  void _showAlertDialog(String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Error',
      desc: 'Please fill in all fields.',
      // btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }
}
