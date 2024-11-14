import 'package:cloud_firestore/cloud_firestore.dart';
import 'courseDataBase.dart' as courseDB;

class AddCourseToDB {
  final CollectionReference coursesCollection =
      FirebaseFirestore.instance.collection('Courses');

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

    //need to change print statements to be logging statements, not important as of yet
    try {
      await coursesCollection.doc(newName).set(newCourse);
      print('Document written with ID: $newName');
    } catch (error) {
      print('Error adding document: $error');
    }
  }
}
