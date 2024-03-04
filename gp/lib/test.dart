// import 'package:flutter/material.dart';

// class FitnessTracker extends StatelessWidget {
//   final String baseUrl;

//   const FitnessTracker({Key? key, required this.baseUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fitness Tracker'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Welcome',
//               style: TextStyle(fontSize: 30, color: Colors.blue),
//             ),
//             SizedBox(height: 20), // Add some space between text and button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => Marketplace(baseUrl: baseUrl)),
//                 );
//               },
//               child: Text('Marketplace', style: TextStyle(fontSize: 20, color: Colors.blue)),
//             ),
//             SizedBox(height: 20), // Add some space between buttons
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => DailyActivityTracker()), // Navigate to daily activity tracker screen
//                 );
//               },
//               child: Text('Daily Activity', style: TextStyle(fontSize: 20, color: Colors.blue)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Marketplace extends StatelessWidget {
//   final String baseUrl;

//   const Marketplace({Key? key, required this.baseUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Marketplace'),
//       ),
//       body: Center(
//         child: Text('Marketplace Content'),
//       ),
//     );
//   }
// }

// class DailyActivityTracker extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Daily Activity Tracker'),
//       ),
//       body: Center(
//         child: Text('Daily Activity Content'),
//       ),
//     );
//   }
// }
 