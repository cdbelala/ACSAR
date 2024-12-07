import 'package:acsar/src/courseDataBase.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/setRoles.dart';
import 'package:flutter/foundation.dart';

class Student {
  String role = "";
  final String name;
  Student(this.name);

  Future<void> addCourse(String courseName, int code, int secNum) async {
    //add course to schedule

    if (role == "IS_STUDENT") {
      //check if user is a student
      try {
        final CollectionReference UserCollection =
            FirebaseFirestore.instance.collection('Users');
        await UserCollection.doc(name) //name of student can prob be deleted
            .collection("Schedule")
            .add({'courseName': courseName, 'code': code, 'secNum': secNum});
        print("Course added Successfully.");
      } catch (fserror) {
        //no error handling yet
      }
    }
  }

  Future<void> removeCourse(String courseName, int code, int secNum) async {
    //remove courses from their schedule,

    if (role == "IS_STUDENT") {
      // validate student
      await Firebase.initializeApp();
      try {
        final QuerySnapshot schedule = await FirebaseFirestore.instance
            .collection('Users') //access the 'Users' Collection
            .doc(name) // ID name
            .collection('Schedule') // access the schedule sub-collection
            .where('courseName', isEqualTo: courseName) // filter by course name
            .get(); // execute query and fetch data

        for (var doc in schedule.docs) {
          // var doc represents each document in schedule.docs
          await doc.reference
              .delete(); //not sure if I needed to do collectionRefrence or just refrence
        }
        print("Course removed Successfully.");
      } catch (fserror) {
        //no error handling yet
      }
    }
  }

  Future<void> addWaitlist(
      String studentEmail, String courseName, int code, int secNum) async {
    // add student to waitlist
    if (role == "IS_STUDENT") {
      // assuming no conflicts
      await Firebase.initializeApp();
      try {
        final CollectionReference UserCollection =
            FirebaseFirestore.instance.collection("User");
        await UserCollection.doc(name).collection("Waitlist").add({
          'courseName': courseName,
          'studentEmail': studentEmail,
          'code': code,
          'secNum': secNum
        });
        print("Added to waitlist Successfully.");
      } catch (fserror) {
        //error handling
      }
    }
  }

  Future<void> removeWaitlist(
      String studentEmail, String courseName, int code, int secNum) async {
    //remove student from waitlist
    if (role == "IS_STUDENT") {
      await Firebase.initializeApp();
      try {
        final QuerySnapshot waitlist = await FirebaseFirestore.instance
            .collection('User')
            .doc(name)
            .collection('Waitlist')
            .where('studentEmail', isEqualTo: studentEmail)
            .get();

        for (var doc in waitlist.docs) {
          await doc.reference.delete();
        }
        print("Removed from waitlist successfully.");
      } catch (fserror) {
        //error handling
      }
    }
  }

  Future<List<Map<String, dynamic>>> readSchedule(String name) async {
    try {
      //refrence to the student's schedule in firestore
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(name)
          .collection('Schedule')
          .get();

      //process each document in the schedule
      List<Map<String, dynamic>> schedule = [];
      for (var doc in snapshot.docs) {
        schedule.add(doc.data() as Map<String, dynamic>);
      }
      return schedule;
      print("Schedule retrieved.");
    } catch (fserror) {
      //error handling
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> readWaitlist(String name) async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .doc(name)
          .collection('Waitlist')
          .get();
      List<Map<String, dynamic>> waitlist = [];
      for (var doc in snapshot.docs) {
        waitlist.add(doc.data() as Map<String, dynamic>);
      }
      return waitlist;
      print("Waitlist retrieved.");
    } catch (fserror) {
      //error handling
      return [];
    }
  }

  Future<List<String>> searchCourses(String courseName) async {
    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection('Courses').get();

      // Store course names in a list
      List<String> courseNames = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; // Explicit cast
        return data['courseName'] as String; // Ensure it's a String
      }).toList();

      for (var doc in snapshot.docs) {
        print(doc.data());
      }

      return courseNames; // Return the list of course names
    } catch (fserror) {
      print("Error fetching courses: $fserror");
      return []; // Return an empty list in case of an error
    }
  }
}
