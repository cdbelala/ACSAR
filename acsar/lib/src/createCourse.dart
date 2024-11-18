import 'package:cloud_firestore/cloud_firestore.dart';
import 'User Backend/adminBack.dart';

class CreateCourse {
  Map<String, dynamic> addCourse(
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
}
