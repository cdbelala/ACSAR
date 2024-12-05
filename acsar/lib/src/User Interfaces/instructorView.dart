import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/User Backend/instructorBack.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ASCAR',
      debugShowCheckedModeBanner: false,
      home: ManageCourseInfo(),
    );
  }
}

class GetDashVals {
  static Map<String, dynamic> course = {
    'courseName': "",
    'enrolled': "",
    'building': "",
    'roomNumber': "",
    'days': "",
    'time': ""
  };
  void populateDashVals() {
    String courseName =
        course['courseName']; // You can replace this with dynamic data
    String enrolled = course['enrolled'].toString(); // Dynamic
    String building = course['building']; // Dynamic
    String roomNumber = course['roomNumber']; // Dynamic
    String days = course['days']; // Dynamic
    String time = course['time']; // Dynamic
  }

  Future<void> getDashVals(String name, Map<String, dynamic> courseInfo) async {
    DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('Courses').doc(name).get();
    Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    course = {
      'courseName': data?['courseName'] as String,
      'enrolled': data?['enrolled'] as int,
      'building': data?['building'] as String,
      'roomNumber': data?['roomNumber'] as String,
      'days': data?['days'] as String,
      'time': data?['time'] as String,
    };
  }
}

class ManageCourseInfo extends StatelessWidget {
  ManageCourseInfo({key}) : super(key: key);
  GetDashVals valGetter = GetDashVals();
  // Simulating database values

  @override
  Widget build(BuildContext context) {
    return Container(); // Replace with your actual widget
  }

  Widget instructorInterface(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ASCAR'),
        backgroundColor: Colors.blue,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/LSU_Tiger_Head.svg/800px-LSU_Tiger_Head.svg.png', // LSU Logo
              height: 40,
            ),
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Manage Course Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GetDashVals.course['courseName'], // Dynamic course name
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'enrolled', // Dynamic enrollment status
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Attach syllabus clicked');
                        // You can handle the syllabus attachment functionality here
                      },
                      child: Text(
                        'Attach Syllabus...',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                        'Building: ${GetDashVals.course['building']}'), // Dynamic building
                    Text(
                        'Room Number: ${GetDashVals.course['roomNumber']}'), // Dynamic room number
                    Text('Days: ${GetDashVals.course['days']}'), // Dynamic days
                    Text('Time: ${GetDashVals.course['time']}'), // Dynamic time
                    SizedBox(height: 20),
                    Divider(),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Request Course Addition from Admin',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Request course addition clicked');
                            // You can handle the course addition request here
                          },
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
