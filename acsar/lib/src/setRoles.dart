import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

bool roleStudent = false;
bool roleInstructor = false;
bool roleAdmin = false;
//function to set the role of a user
Future<void> setRoles(
    String uid, bool isStudent, bool isInstructor, bool isAdmin) async {
  //set the role of the user
  roleStudent = isStudent;
  roleInstructor = isInstructor;
  roleAdmin = isAdmin;

  //update the role of the user in the database
  await Firebase.initializeApp();
  await FirebaseFirestore.instance
      .collection('Email Addresses')
      .doc(uid)
      .update(
          {'Admin': isAdmin, 'Instructor': isInstructor, 'Student': isStudent});
}
