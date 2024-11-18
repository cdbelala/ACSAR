import 'package:cloud_firestore/cloud_firestore.dart';
import 'User Backend/adminBack.dart';
import 'User Backend/instructorBack.dart';
import 'User Backend/studentBack.dart';

//class to define the 'DataBase' type and its atrributes,
//as well as accessing the data within the database

const error = "error 404";
const errorNum = 404;

class DataBase {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  //The function sets the variables for the relevant course in the 'Course' class
  //and the 'addCouse' function adds it to the Firebase database.
  //void setVars() {}

  void getCourses() async {
    final coursesCollection = db.collection('Courses');
    //QuerySnapshot snapshot = await coursesCollection.get();
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

class DataBaseActions {
  Map<String, dynamic> createCourse(
      newAvailSlots,
      newEnrlCount,
      newStartTime,
      newEndTime,
      newCode,
      newRoomNum,
      newSecNum,
      newCourseName,
      newDays,
      newProf,
      newBldg,
      newName) {
    final Map<String, dynamic> course = {
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
    return course;
  }

  Future<bool> addCourseToDB(Map<String, dynamic> newCourse) async {
    String newName = newCourse['Course Name'];

    //need to change print statements to be logging statements, not important as of yet
    try {
      await coursesCollection.doc(newName).set(newCourse);
      print('Document written with ID: $newName');
      return true;
    } catch (error) {
      print('Error adding document: $error');
      return false;
    }
  }

  Future<void> viewCourses() async {
    try {
      //double check logic later, may need to get a query snapshot
      final db = courseDB.DataBase();
      final coursesCollection = db.db.collection('Courses');
      final snapshot = await coursesCollection.get();

      for (var doc in snapshot.docs) {
        print("Course ID: ${doc.id}");
        print(doc.data());
        print("-------------------------");
      }
    } catch (error) {
      print('Error retrieving courses: $error');
    }
  }

  Future<void> deleteCourse(String courseId) async {
    try {
      final db = courseDB.DataBase();
      final coursesCollection = db.db.collection('Courses');
      await coursesCollection.doc(courseId).delete();
      print('Course deleted successfully');
    } catch (error) {
      print('Error deleting course: $error');
    }
  }

  Future<void> addInstructor(String email) async {
    try {
      final db = courseDB.DataBase();
      final instructorsCollection = db.db.collection('Instructors');
      await instructorsCollection.doc(email).set({'Email': email});

      print('Instructor added successfully');
    } catch (error) {
      print('Error adding instructor: $error');
    }
  }

  Future<void> removeInstructor(String email) async {
    try {
      final db = courseDB.DataBase();
      final instructorsCollection = db.db.collection('Instructors');
      await instructorsCollection.doc(email).delete();
      print('Instructor removed successfully');
    } catch (error) {
      print('Error removing instructor: $error');
    }
  }

  Future<void> addStudent(String email) async {
    try {
      final db = courseDB.DataBase();
      final studentsCollection = db.db.collection('Students');
      await studentsCollection.doc(email).set({'Email': email});
      print('Student added successfully');
    } catch (error) {
      print('Error adding student: $error');
    }
  }

  Future<void> removeStudent(String email) async {
    try {
      final db = courseDB.DataBase();
      final studentsCollection = db.db.collection('Students');
      await studentsCollection.doc(email).delete();
      print('Student removed successfully');
    } catch (error) {
      print('Error removing student: $error');
    }
  }

  //role method too big to keep here, will reference it using getRole
}
