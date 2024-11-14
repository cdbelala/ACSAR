import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'setRoles.dart';

class UserAuthentication {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  String emailAddress = "";
  String password = "";

  bool isStudent = false;
  bool isInstructor = false;
  bool isAdmin = false;

  final String roleStudent = "IS_STUDENT";
  final String roleInstructor = "IS_INSTRUCTOR";
  final String roleAdmin = "IS_ADMIN";

  //will be moved to sign up program soon
  void signUp(String email, String password, String role) async {
    String newEmail = email;
    String newPassword = password;
    //determine user role here

    await Firebase.initializeApp();
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: newEmail, password: newPassword);
  }

  void login(String email, String password, String role) async {
    SetRoles setRoles = new SetRoles();

    String inputRole = role;
    String inputEmail = email;
    String inputPassword = password;

    await Firebase.initializeApp();

    if (inputEmail == null || inputPassword == null) {
      String errorMsg = "Error, no email and password detected";
      //need to return this somehow
    }

    //check if email and password are valid (not implemented yet)

    //sign in user
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    //role determines the interface shown to the user
    if (isStudent == true) {
      role = roleStudent;
    } else if (isInstructor == true) {
      role = roleInstructor;
    } else if (isAdmin == true) {
      role = roleAdmin;
    }

    switch (role) {
      case "IS_STUDENT":

        //show student interface here
        break;
      case "IS_INSTRUCTOR":

        //show instructor interface here
        break;
      case "IS_ADMIN":

        //show admin interface here
        break;
    }
  }
}
