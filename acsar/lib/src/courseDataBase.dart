import 'package:cloud_firestore/cloud_firestore.dart';

class dataBase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //Admin view function to add courses.
  //The function sets the variables for the relevant course in the 'Course' class
  //and the 'addCouse' function adds it to the Firebase database.
  void setVars() {}
  void addCourse(
      String code, int time, String prof, int id, String days, String name) {
    Course thisCourse = new Course();
    final coursesCollection = db.collection('Courses');
  }
}

//class to define the 'Course' type
class Course {
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
}
