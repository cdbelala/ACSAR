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
  runApp(MyApp());
  //log in if already signed up, and show appropriate interface depending on role
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  ChooseLogin roleLogin = ChooseLogin();
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Log In!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: roleLogin.login(context),
    );
  }
}
