import 'package:flutter/material.dart';
import 'package:acsar/src/User Interfaces/login_signup.dart';

class Student {
  static Widget studentView(BuildContext context) {
    return Scaffold(
      body:
          SearchBar.searchBar(context), //will be replaced by student interface
    );
  }
}

class SearchBar {
  static Widget searchBar(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Search")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print("Search bar tapped!");
            FocusScope.of(context)
                .requestFocus(FocusNode()); // Dismiss keyboard
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.grey),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    //controller: searchController,
                    decoration: InputDecoration(
                      hintText: "CSC 4...",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) {
                      print("Search text submitted: $value");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
