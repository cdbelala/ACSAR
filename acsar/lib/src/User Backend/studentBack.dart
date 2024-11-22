import 'package:acsar/src/courseDataBase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conflictChkr.dart'; 
import 'package:calenderview.dart'; 
import 'package:setRoles.dart'; 

// needs to do:
// pull setroles program 
// verify student/ verifying its the right student 
// fill in catches and if statments 

class Student { 
  final String name;

  student(this.name);

  Future<void> addCourse(String courseName, int code, int secNum) async {  //add course to schedule

    if(isstudent()){    //check if user is a student 
      await Firebase.initializeApp();  //Initializes firebase once globally
      try {
        final CollectionReference UserCollection = FirebaseFirestore.instance.collection('Users');
        await UserCollection
          .doc(Name) //name of student can prob be deleted 
          .collection("Schedule")
          .add({'courseName': courseName, 'code':code, 'secNum': secNum});
        print ("Course added Successfully.");

      } catch(){
        //no error handling yet 
      } 
    }
  }

 Future<void> removeCourse(String courseName, int code, int secNum) async {   //remove courses from their schedule,

    if(isstudent()){ // validate student 
        await Firebase.initializeApp();
        try{
          final QuerySnapshot schedule = await FirebaseFirestore.instance
              .collection('Users')  //access the 'Users' Collection
              .doc(name)            // ID name
              .collection('Schedule')  // access the schedule sub-collection 
              .where('courseName', isEqualTo: courseName)  // filter by course name 
              .get();   // execute query and fetch data 

        for (var doc in schedule.docs) {    // var doc represents each document in schedule.docs
          await doc.reference.delete();  //not sure if I needed to do collectionRefrence or just refrence 
        } 
        print("Course removed Successfully.");

       } catch(){
          //no error handling yet 
       }
    }   
  }

  Future<void> addWaitlist(String Studentemail String courseName, int code, int secNum) async {  // add student to waitlist 

   if() {   // assuming no conflits 
      await Firebase.initializeApp();
      try
        final CollectionReference UserCollection = FirebaseFirestore.instance.collection("User"); 
        await UserCollection
            .doc(name)
            .collection("Waitlist")
            .add({'courseName': courseName, 'studentemail': studentemail, 'code': code, 'secNum': secNum});
        print("Added to waitlist Successfully."); 
   } catch() { 
          //error handling 
      }
    }
  }

  Future<void> removeWaitlist(String Studentemail String courseName, int code, int secNum ) async {  //remove student from waitlist
    if() { 
        await Firebase.initializeApp(); 
        try{ 
          final QuerySnapshot waitlist = await FirebaseFirestore.instance
            .collection('User')
            .doc(name)
            .collection('Waitlist')
            .where('Studentemail', isEqualTo:studentemail)
            .get(); 

        for (var doc in waitlist.docs) { 
          await doc.reference.delete(); 
        } 
        print("Removed from waitlist successfully.");
        } catch(){ 
            //error handling 
          //print("Failed to remove from waitlist: error message??"); 
       }
    }
  }

Future<List<Map<String, dynamic >>> readschedule() async { 

  try { 
    //refrence to the student's schedule in firestore 
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
      .collection('Users')
      .doc(name)
      .collection('Schedule')
      .get(); 

    //process each document in the schedule 
    for (var doc in snapshot.docs){ 
      schedule.add(doc.data() as Map<String, dynamic>);
    }

    print("Schedule retrieved."); 
  } catch() { 
   // catch error 
   //print("Failed to Retireve schedule: ")
  }
   return schedule; 
 }

 Future<List<Map<String, dynamic>>> readWaitlist() async { 
   List<Map<String, dynamic>>> waitlist = []; // stores waitlist in string 

  try { 
    //query the waitlist sub-collection for the user 
    final  QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('User')
        .doc(name)
        .collection('Waitlist')
        .get(); 

    //loop each doc in waitlist to extract data 
    for (var doc in snapshot.docs){ 
      waitlist.add(doc.data() as Map<String, dynamic>); 
    }
      print("Waitlist Retrieved")
  } catch () {
    //print("Error reading waitlist: ")
  }
  return waitlist;
  // should return an empty list if nothing on waitlist
 }
