//dependencies
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//custom files
import 'package:acsar/src/courseDataBase.dart';
import 'package:acsar/src/setRoles.dart';
import 'package:acsar/src/User Interfaces/login_signup.dart';
import 'package:acsar/src/User Interfaces/adminView.dart';
import 'package:acsar/src/User Interfaces/instructorView.dart';
import 'package:acsar/src/User Interfaces/studentView.dart';

SetRoles setRoles = SetRoles();
bool isStudent = setRoles.roleStudentTrue;
bool isInstructor = setRoles.roleInstructorTrue;
bool isAdmin = setRoles.roleAdminTrue;
String userRole = setRoles.role;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  String logInEmail;
  String logInPassword;

  //on open, show the login/signup page
  ChooseLogin logIn = ChooseLogin();
  Widget loginSignupView(BuildContext context) {
    return MaterialApp(
      title: 'Login/Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: logIn.login(context),
    );
  }

  //log in if already signed up, and show appropriate interface depending on role

  switch (userRole) {
    case "IS_STUDENT":
      Widget studentView(BuildContext context) {
        return MaterialApp(
          title: 'Student Dashboard',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: studentView(
              context), //will show student interface when implemented
        );
      }
    case "IS_INSTRUCTOR":
      Widget instructorView(BuildContext context) {
        return MaterialApp(
          title: 'Instructor Dashboard',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: instructorView(
              context), //will show instructor interface when implemented
        );
      }
    case "IS_ADMIN":
      Widget adminView(BuildContext context) {
        return MaterialApp(
          title: 'Admin Dashboard',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: adminView(context), //will show admin interface when implemented
        );
      }
  }
  //if not signed up, write user info to firebase DB to add as either an admin, student, or instructor
}

//--------------------below this may possible be deleted-----------------

