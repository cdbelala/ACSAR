import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/courseDataBase.dart';

class InstructorController {
  //instructor details
  final String email = "";
  final String name = "";
  final int phone = 0;

  //final version of these functions will not have void return type
  void addStudentToCourse(String studentEmail, String courseName) {
    //check if course is owned by the instructor
    //add student to course if course is owned by the instructor
  }

  void removeStudentFromCourse(String studentEmail, String courseName) {
    //check if course is owned by the instructor
    //remove student from course if course is owned by the instructor
  }

  void viewCourses() {
    //view courses owned by the instructor
  }

  void viewStudents() {
    //prompt instructor for course name
    //check if course is owned by the instructor
    //view students in course
  }

  void viewCourseDetails(String courseName) {
    //prompt instructor for course name
    //check if course is owned by the instructor
    //view course details
  }

  void viewInstructorSchedule() {
    //display all courses owned by the instructor from firestore DB (will be
    //stored in the 'users' collection, appended to the instructor's document)
  }
}
