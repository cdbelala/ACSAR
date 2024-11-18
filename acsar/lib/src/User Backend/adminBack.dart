import 'package:acsar/src/addCourse.dart';
import 'package:acsar/src/createCourse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  String name;
  bool isAdmin;

  Admin({required this.name, required this.isAdmin});

  Future<void> setCourse() async {
    //data to create courses comes from administrator.
    //These values are created here.
    //input will come from admin inteface, for now they are set to null
    int availSlots = 0;
    int enrlCount = 0;
    int startTime = 0;
    int endTime = 0;
    int code = 0;
    int roomNum = 0;
    int secNum = 0;
    String courseName = "";
    String days = "";
    String prof = "";
    String bldg = "";

    CreateCourse courseCreator = CreateCourse();
    Map<String, dynamic> course = courseCreator.addCourse(
        availSlots,
        enrlCount,
        startTime,
        endTime,
        code,
        roomNum,
        secNum,
        courseName,
        days,
        prof,
        bldg,
        name);

    if (!isAdmin) {
      print("Error: Only admins can add courses.");
      return;
    }

    // Create a unique identifier for the course document
    final courseId = '${courseName}_${secNum}_$code';

    // Use AddCourseToDB to add the course to Firestore
    AddCourseToDB courseAdder = AddCourseToDB();
    bool courseAdded = await courseAdder.addCourse(course);
    if (courseAdded) {
      print('Course added successfully');
    } else {
      print('Error adding course');
    }
  }
}
