//import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'userAuth.dart';

final String roleStudent = "IS_STUDENT";
final String roleInstructor = "IS_INSTRUCTOR";
final String roleAdmin = "IS_ADMIN";

bool roleStudentTrue = false;
bool roleInstructorTrue = false;
bool roleAdminTrue = false;

//class to set the role of a user
class SetRoles {
  UserAuthentication userAuth = new UserAuthentication();
  Future<void> setRoles(String email, String uid, bool isStudent,
      bool isInstructor, bool isAdmin) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    //set the role of the user
    roleStudentTrue = isStudent;
    roleInstructorTrue = isInstructor;
    roleAdminTrue = isAdmin;

    String role = "";
    if (isStudent == true) {
      role = roleStudent;
    } else if (isInstructor == true) {
      role = roleInstructor;
    } else if (isAdmin == true) {
      role = roleAdmin;
    }

    switch (role) {
      case "IS_STUDENT":
        isStudent = true;
        isInstructor = false;
        isAdmin = false;
        db.collection('Email Addresses').doc(email).update({'Student': true});
        db
            .collection('Email Addresses')
            .doc(email)
            .update({'Instructor': false});
        db.collection('Email Addresses').doc(email).update({'Admin': false});
        break;
      case "IS_INSTRUCTOR":
        isStudent = false;
        isInstructor = true;
        isAdmin = false;
        db.collection('Email Addresses').doc(email).update({'Student': false});
        db
            .collection('Email Addresses')
            .doc(email)
            .update({'Instructor': true});
        db.collection('Email Addresses').doc(email).update({'Admin': false});
        break;
      case "IS_ADMIN":
        isStudent = false;
        isInstructor = false;
        isAdmin = true;
        db.collection('Email Addresses').doc(email).update({'Student': false});
        db
            .collection('Email Addresses')
            .doc(email)
            .update({'Instructor': false});
        db.collection('Email Addresses').doc(email).update({'Admin': true});
        break;
    }
  }
}
