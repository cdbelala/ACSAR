import 'package:flutter/material.dart';
import 'package:acsar/src/User Interfaces/login_signup.dart';
import '../User Backend/studentBack.dart';

class Student {
  static Widget studentView(BuildContext context) {
    return Scaffold(
      body: SearchBar.searchBar(context),
    );
  }
}

class SearchBar {
  static List<String> _courseNames = [
    'CSC 2362',
    'CSC 3200',
    'CSC 3380',
    'CSC 3501',
    'CSC 4101',
    'CSC 4103',
    'CSC 4330',
    'CSC 4351',
    'CSC 4501',
  ]; // Mocked list for testing

  static ValueNotifier<List<String>> _schedule =
      ValueNotifier<List<String>>([]);

  static Widget searchBar(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    ValueNotifier<List<String>> filteredCourses =
        ValueNotifier<List<String>>([]);

    void updateSuggestions(String query) {
      if (query.isEmpty) {
        filteredCourses.value = [];
      } else {
        filteredCourses.value = _courseNames
            .where(
                (course) => course.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    }

    void addToSchedule(String course) {
      if (!_schedule.value.contains(course)) {
        _schedule.value = [..._schedule.value, course];
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text("Course Search")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100), // Spacer for the floating box

                // Search Bar
                Container(
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
                          controller: searchController,
                          decoration: InputDecoration(
                            hintText: "CSC...",
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            updateSuggestions(value);
                          },
                          onSubmitted: (value) {
                            print("Search text submitted: $value");
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                // Suggestions List (Limited to 5 Suggestions)
                ValueListenableBuilder<List<String>>(
                  valueListenable: filteredCourses,
                  builder: (context, suggestions, _) {
                    if (suggestions.isEmpty) {
                      return Container();
                    }
                    return Container(
                      width: 300,
                      height: 150, // Adjust height if needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView.builder(
                        itemCount:
                            suggestions.length > 5 ? 5 : suggestions.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(suggestions[index]),
                            onTap: () {
                              addToSchedule(suggestions[index]);
                              searchController.clear();
                              filteredCourses.value = [];
                              print('Added to schedule: ${suggestions[index]}');
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),

            // Floating Purple Box for "My Schedule"
            Positioned(
              top: MediaQuery.of(context).size.height / 5,
              child: Container(
                width: 320,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF8B24C9), // Purple color
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Schedule",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(color: Colors.white),
                    ValueListenableBuilder<List<String>>(
                      valueListenable: _schedule,
                      builder: (context, schedule, _) {
                        if (schedule.isEmpty) {
                          return Text(
                            "No courses added yet",
                            style: TextStyle(color: Colors.white),
                          );
                        }
                        return Column(
                          children: schedule
                              .map(
                                (course) => Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Text(
                                    course,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                              .toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
