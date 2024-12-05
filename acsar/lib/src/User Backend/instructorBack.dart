import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/courseDataBase.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/courseDataBase.dart';

class InstructorController {
  // Instructor details
  final String email = "";
  final String name = "";
  final int phone = 0;

  // Add a student to a course
  Future<void> addStudentToCourse(
      String studentEmail, String courseName) async {
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();

      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructorEmail'] == email) {
          await FirebaseFirestore.instance
              .collection('courses')
              .doc(courseName)
              .update({
            'students': FieldValue.arrayUnion([studentEmail]),
          });
          print('Student added to the course successfully.');
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist.');
      }
    } catch (fserror) {
      print('Error adding student: $fserror');
    }
  }

  // Remove a student from a course
  Future<void> removeStudentFromCourse(
      String studentEmail, String courseName) async {
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();

      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructorEmail'] == email) {
          if (courseData.containsKey('students')) {
            List<dynamic> students = courseData['students'];
            if (students.contains(studentEmail)) {
              await FirebaseFirestore.instance
                  .collection('courses')
                  .doc(courseName)
                  .update({
                'students': FieldValue.arrayRemove([studentEmail]),
              });
              print('$studentEmail has been removed from $courseName.');
            } else {
              print('$studentEmail is not enrolled in $courseName.');
            }
          } else {
            print('No students are enrolled in this course.');
          }
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist.');
      }
    } catch (fserror) {
      print('Error removing student: $fserror');
    }
  }

  // View students in a course
  Future<void> viewStudent(String courseName) async {
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();

      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructorEmail'] == email) {
          if (courseData.containsKey('students')) {
            List<dynamic> students = courseData['students'];
            if (students.isNotEmpty) {
              print('Students enrolled in $courseName:');
              for (var student in students) {
                print('- $student');
              }
            } else {
              print('No students are enrolled in $courseName.');
            }
          } else {
            print('No students found in this course.');
          }
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist.');
      }
    } catch (fserror) {
      print('Error viewing students: $fserror');
    }
  }

  // View course details
  Future<void> viewCourseDetails(String courseName) async {
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();

      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructorEmail'] == email) {
          print('Course Details: $courseData');
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist.');
      }
    } catch (fserror) {
      print('Error viewing course details: $fserror');
    }
  }

  // View instructor's schedule
  Future<void> viewInstructorSchedule() async {
    try {
      final instructorSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(email).get();

      if (instructorSnapshot.exists) {
        final instructorData = instructorSnapshot.data();
        if (instructorData != null) {
          print('Schedule: ${instructorData['courses']}');
        }
      } else {
        print('Instructor does not exist.');
      }
    } catch (fserror) {
      print('Error viewing schedule: $fserror');
    }
  }

  // View waitlist for a course
  Future<void> viewWaitlist(String courseName) async {
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();

      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructorEmail'] == email) {
          if (courseData.containsKey('waitlist')) {
            List<dynamic> waitlist = courseData['waitlist'];
            if (waitlist.isNotEmpty) {
              print('Waitlist for $courseName:');
              for (var student in waitlist) {
                print('- $student');
              }
            } else {
              print('The waitlist for $courseName is empty.');
            }
          } else {
            print('No waitlist found for this course.');
          }
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist.');
      }
    } catch (fserror) {
      print('Error viewing waitlist: $fserror');
    }
  }
}
