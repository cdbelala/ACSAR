import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/courseDataBase.dart';

class SearchBarController {
  //create search value as a string

  //method to create query to DB according to what is in the string
  Future<Map<String, dynamic>> searchQuery(String searchValue) async {
    //query to prompt DB for courses
    QuerySnapshot<Object?> snapshot = await FirebaseFirestore.instance
        .collection('Courses')
        //.where('courseName', isEqualTo: searchValue)
        .get();
    //save query results in a map to display on the search bar
    Map<String, dynamic> coursesSnapshot = {
      'courseName': snapshot.docs[0]['courseName'],
    };
    return coursesSnapshot;
  }

  //display results in search bar on student dashboard
  //update query as the string is updated
}
