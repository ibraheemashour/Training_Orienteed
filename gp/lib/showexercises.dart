import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExerciseListPage extends StatefulWidget {
  final String category;
  final String baseUrl;

  ExerciseListPage({Key? key, required this.baseUrl, required this.category})
      : super(key: key);

  @override
  _ExerciseListPageState createState() => _ExerciseListPageState();
}

class _ExerciseListPageState extends State<ExerciseListPage> {
  List<Exercise> exercises = []; // Holds Exercise objects
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchExercises();
  }

  Future<void> fetchExercises() async {
    try {
      final response = await http.get(
          Uri.parse('${widget.baseUrl}/exercisesmobile/${widget.category}'));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body);
        final exerciseList = decodedData['exercises'] as List;
        setState(() {
          exercises = exerciseList
              .map((exerciseData) => Exercise.fromJson(exerciseData))
              .toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load exercises');
      }
    } catch (error) {
      print('Error fetching exercises: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exercises - ${widget.category}'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : exercises.isEmpty
//               ? Center(child: Text('No exercises found'))
//               : ListView.builder(
//                   itemCount: exercises.length,
//                   itemBuilder: (context, index) {
//                     final exercise = exercises[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Container(
//                         width: 120.0, // Adjust width here
//                         height: 120.0, // Adjust height here
//                         child: Card(
//                           elevation: 8,
//                           child: ListTile(
//                             title: Text("4 Rounds"),
//                             leading: exercise.imageUrl != null
//                                 ? Padding(
//                                     padding: const EdgeInsets.only(top: 20.0),
//                                     child: SizedBox(
//                                       width: 150,
//                                       height: 100,
//                                       child: Image.network(
//                                         exercise.imageUrl!,
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                   )
//                                 : null,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }







//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Exercises - ${widget.category}'),
//       ),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : exercises.isEmpty
//               ? Center(child: Text('No exercises found'))
//               : ListView.builder(
//                   itemCount: exercises.length,
//                   itemBuilder: (context, index) {
//                     final exercise = exercises[index];
//                     return Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Card(
//                         elevation: 8,
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0), // Increase padding here
//                           child: ListTile(
//                             title: Text("4 Rounds"),
//                             leading: Container(
//                               width: 100,
//                               height: 100,
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: NetworkImage(exercise.imageUrl!),
//                                   fit: BoxFit.contain, // Change BoxFit here
                                
//                                 ),
//                                 borderRadius: BorderRadius.circular(8.0),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//     );
//   }
// }





@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises - ${widget.category}',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue[800]),),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : exercises.isEmpty
              ? Center(child: Text('No exercises found'))
              : ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Card(
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              exercise.imageUrl!,
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child:Text(
                                    "4 Rounds",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  ),
                                  
                                  SizedBox(height: 5),
                                  // Text(
                                  //   exercise.name,
                                  //   style: TextStyle(
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),


    





    );
  }
}





class Exercise {
  final String id;
  final String name; // Assuming 'name' is present in the response
  final String? imageUrl; // Handle cases where imageUrl may be absent

  Exercise.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        name = json['name'] ?? 'Exercise ${json['id']}', // Default name
        imageUrl = json['image'];
}




  // body: isLoading
  // ? Center(child: CircularProgressIndicator())
  // : exercises.isEmpty
  //   ? Center(child: Text('No exercises found'))
  //   : SingleChildScrollView(
  //       child: Wrap(
  //         spacing: 4.0,
  //         runSpacing: 4.0,
  //         alignment: WrapAlignment.spaceEvenly,
  //         children: List.generate(
  //           exercises.length,
  //           (index) {
  //             final exercise = exercises[index];
  //             return SizedBox(
  //               width: MediaQuery.of(context).size.width / 2 - 8.0,
  //               child: Card(
  //                 elevation: 4,
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Image.network(
  //                       exercise.imageUrl!,
  //                       height: 200,
  //                       width: double.infinity,
  //                       fit: BoxFit.fill,
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Column(
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Center(
  //                             child:Text(
  //                               "4 Rounds",
  //                               style: TextStyle(
  //                                 fontWeight: FontWeight.bold,
  //                               ),
  //                             ),
  //                           ),
  //                           SizedBox(height: 5),
  //                           // Text(
  //                           //   exercise.name,
  //                           //   style: TextStyle(
  //                           //     fontWeight: FontWeight.bold,
  //                           //   ),
  //                           // ),
  //                         ],
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             );
  //           },
  //         ).toList(),
  //       ),
  //     ),