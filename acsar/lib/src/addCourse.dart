import 'package:cloud_firestore/cloud_firestore.dart';
import 'courseDataBase.dart' as courseDB;
import 'createCourse.dart';
import 'User Backend/adminBack.dart';

final int error = 404;

class AddCourseToDB {
  final CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('Courses');

  Future<bool> addCourse(Map<String, dynamic> newCourse) async {
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
}
