import 'courseDataBase.dart' as courseDB;
import 'addCourse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  final String name;
  final bool isAdmin;

  Admin({required this.name, required this.isAdmin});

  Future<void> addCourse(
    int availSlots,
    int enrlCount,
    int startTime,
    int endTime,
    int code,
    int roomNum,
    int secNum,
    String courseName,
    String days,
    String prof,
    String bldg,
  ) async {
    if (!isAdmin) {
      print("Error: Only admins can add courses.");
      return;
    }

    // Create a unique identifier for the course document
    final courseId = '${courseName}_${secNum}_$code';

    // Use AddCourseToDB to add the course to Firestore
    final courseAdder = AddCourseToDB();
    await courseAdder.addCourse(
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
      courseId,
    );
  }

  Future<void> viewCourses() async {
    try {
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
}

