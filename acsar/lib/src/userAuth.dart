import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'setRoles.dart';

class UserAuthentication {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final emailAddress = "";
  final password = "";

  bool isStudent = false;
  bool isInstructor = false;
  bool isAdmin = false;

  final String roleStudent = "IS_STUDENT";
  final String roleInstructor = "IS_INSTRUCTOR";
  final String roleAdmin = "IS_ADMIN";

  void signUp(String email, String password, String role) async {
    String newEmail = email;
    String newPassword = password;

    await Firebase.initializeApp();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: newEmail, password: newPassword);
  }

  void login(String email, String password, String role) async {
    String role = "";

    await Firebase.initializeApp();
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    if (isStudent == true) {
      role = roleStudent;
    } else if (isInstructor == true) {
      role = roleInstructor;
    } else if (isAdmin == true) {
      role = roleAdmin;
    }

    //need to find a way to check and see if the 'email' value does not exist
    //before checking, not sure how to do that yet
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
        //show student interface here
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
        //show instructor interface here
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
        //show admin interface here
        break;
    }
  }
}
