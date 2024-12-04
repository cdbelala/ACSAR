import 'package:flutter/material.dart';

class Student {
  Widget studentView(BuildContext context) {
    return Scaffold(
      body: Text('Student Dashboard'), //will be replaced by student interface
    );
  }
}

class SearchBar {
  Widget searchBar(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Bar Example")),
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
                      hintText: "Search here...",
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
