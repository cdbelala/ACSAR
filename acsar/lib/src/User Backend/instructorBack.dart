import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/courseDataBase.dart';

class InstructorController {
  //instructor details
  final String email = "";
  final String name = "";
  final int phone = 0;

  //final version of these functions will not have void return type
  Future<void> addStudentToCourse(String studentEmail, String courseName) async {
    //check if course is owned by the instructor
    //add student to course if course is owned by the instructor
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get();
      
      if(courseSnapshot.exists){
        final courseData = courseSnapshot.data();
        if(courseData != null && courseData['instructorEmail'] == email) {

          await FirebaseFirestore.instance
            .collection('courses')
            .doc(courseName)
            .update({'student': FieldValue.arrayUnion([studentEmail])
          });
          print('Student added to the course successfully.');
        } else {
          print('You do not own this course.');
        }
      } else {
        print('Course does not exist');
      }
    } catch (fserror){
        }
      }

  Future<void> removeStudentFromCourse(String studentEmail, String courseName) async {
    //check if course is owned by the instructor
    //remove student from course if course is owned by the instructor
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get(); 

      if(courseSnapshot.exists)
      final courseData = courseSnapshot.data();

        if (courseData != null && courseData['instructorEmail'] == email) {
          // Check if students field exists and if the student is enrolled
          if (courseData.containsKey('students')) {
            List<dynamic> students = courseData['students'];
            if (students.contains(studentEmail)) {
              // Remove the student from the list
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
      print('Error removing student: $e');
    }

  Future<void> viewStudent(String courseName) async {
    //prompt instructor for student email
    //check if student is in the course
    //view student details
    try {
    // Fetch course details from Firestore
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
              print('- $student'); // Print each student's email
            }
          } else {
            print('No students are enrolled in $courseName.');
          }
      } else {
        print('You do not own this course.');
      }
    } else {
      print('Course does not exist.');
    }
  } catch (fserror) {
      }
    }
  }
     Future<void> viewStudentsDetails() {
    //prompt instructor for course name
    //check if course is owned by the instructor
    //view students in course
    try {
    // Fetch course details
    final courseSnapshot = await FirebaseFirestore.instance
        .collection('courses')
        .doc(courseName)
        .get();

    if (courseSnapshot.exists) {
      final courseData = courseSnapshot.data();

      if (courseData != null && courseData['instructorEmail'] == email) {
        // Check if the student is enrolled
        List<dynamic> students = courseData['students'] ?? [];
        if (students.contains(studentEmail)) {
          // Fetch student details from Firestore
          final studentSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(studentEmail)
              .get();

          if (studentSnapshot.exists) {
            final studentData = studentSnapshot.data();
            print('Details for $studentEmail:');
            studentData?.forEach((key, value) {
              print('$key: $value');
            });
          } else {
            print('Student details not found.');
          }
        } else {
          print('$studentEmail is not enrolled in $courseName.');
        }
      } else {
        print('You do not own this course.');
      }
    } else {
      print('Course does not exist.');
    }
  } catch (fserror) {
   
      }
    }

  Future<void> viewCourseDetails(String courseName) async {
    //prompt instructor for course name
    //check if course is owned by the instructor
    //view course details
    try {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseName)
          .get(); 

      if(courseSnapshot.exists){ 
        final courseData = courseSnapshot.data();
        if (courseData != null && courseData['instructor'] == email){
          print('Course Details: $courseData');
        } else { 
          print('You do not own this course'); 
        }
      } else { 
        print('Course does not exist.');
      }
     } catch (fserror){
      }
    }

  Future<void> viewInstructorSchedule() async {
    //display all courses owned by the instructor from firestore DB (will be
    //stored in the 'users' collection, appended to the instructor's document)
    try { 
      final instructorSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(email)
          .get();

      if(instructorSnapshot.exists){
        final instructorData = instructorSnapshot.data(); 
        if (instructorData != null) {
          print ('Schedule: ${instructorData['courses']}'); 
        }
      } else { 
        print ('Instructor does not exist.');
      } 
    } catch (fserror){ 
  }
}
  Future<void> viewWaitlist(String courseName) async {
    //prompt instructor for course name
    //check if course is owned by the instructor
    //view waitlist
    try { 
      final courseSnapshot = await FirebaseFirestore.instance
       .collection('courses')
       .doc(courseName)
       .get(); 

    if (courseSnapshot.exists) {
      final courseData = courseSnapshot.data(); 

      if(courseData != null && courseData ['instructorEmail'] == email) { 
        // check if waitlist exists
        if (courseData.containsKey('Waitlist')) {
          List<dynamic> waitlist = courseData['waitlist'];
          if (waitlist.isNotEmpty) { 
            print('Waitlist for $courseName:'); 
            for (var student in waitlist) { 
              print('- %student');
            }
          } else { 
            print ('The waitlist for $courseName is empty.'); 
          }
      } else {
        print ('Course does not exist.')
      }
    } catch (fserror){ 

    }
  }
    
    }
  }
}
