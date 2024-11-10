import 'package:cloud_firestore/cloud_firestore.dart';

//class to define the 'DataBase' type and its atrributes,
//as well as accessing the data within the database

const error = "error 404";

class DataBase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Admin view function to add courses.
  //The function sets the variables for the relevant course in the 'Course' class
  //and the 'addCouse' function adds it to the Firebase database.
  //void setVars() {}
  void addCourse(
      int newAvailSlots,
      int newEnrlCount,
      int newStartTime,
      int newEndTime,
      int newCode,
      int newRoomNum,
      int newSecNum,
      String newCourseName,
      String newDays,
      String newProf,
      String newBldg,
      String newName) async {
    final coursesCollection = db.collection('Courses');
    final newCourse = {
      'Available Slots': newAvailSlots,
      'Enrolled Count': newEnrlCount,
      'Start Time': newStartTime,
      'End Time': newEndTime,
      'Code': newCode,
      'Room Number': newRoomNum,
      'Section Number': newSecNum,
      'Course Name': newCourseName,
      'Days': newDays,
      'Professor': newProf,
      'Building': newBldg,
      'Name': newName
    };
    try {
      await coursesCollection.doc(newName).set(newCourse);
      print('Document written with ID: $newName');
    } catch (error) {
      print('Error adding document: $error');
    }
  }

  void getCourses() async {
    final coursesCollection = db.collection('Courses');
    QuerySnapshot snapshot = await coursesCollection.get();
  }
}

//class to define the 'Course' type and its atrributes
class Course {
  int availSlots = 0; //number of available slots
  int enrlCount = 0; //number of enrolled students
  int startTime = 0; //start time of the course in form HHMM
  int endTime = 0; //end time of the course in form HHMM
  int code = 0; //course code (e.g. XXX 1234)
  int roomNum = 0; //room number
  int secNum = 0; //section number
  String courseName = ""; //course name (e.g. 'CSC' or ('MATH'))
  String days = ""; //days the course is held in form 'MWF' or 'T TH'
  String prof = ""; //professor last name, first initial
  String bldg = ""; //building (e.g. 'PFT' or 'Lockett')
}
