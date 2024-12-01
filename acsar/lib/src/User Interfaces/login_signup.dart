import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:acsar/src/User Interfaces/studentView.dart';
import 'package:acsar/src/User Interfaces/instructorView.dart';
import 'package:acsar/src/User Interfaces/adminView.dart';

LoginCtrl loginCtrl = LoginCtrl();
final String role = loginCtrl.userRole;

class ChooseLogin extends StatelessWidget {
  ChooseLogin({Key? key}) : super(key: key);

  //interface instances
  final Student studentDash = Student();
  final Instructor instructorDash = Instructor();
  final Admin adminDash = Admin();
  login_signup loginPage = login_signup();

  @override
  Widget build(BuildContext context) => Container(
        width: 1440,
        height: 1024,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/1440x1024"),
            fit: BoxFit.contain,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 1440,
              height: 1024,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 1440,
                    height: 124,
                    decoration: BoxDecoration(color: Color(0xFF8B24C9)),
                  ),
                  Container(
                    width: 308,
                    height: 91,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/308x91"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1309,
                    height: 168,
                    child: Text(
                      'WELCOME TO ASCAR',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF295EFF),
                        fontSize: 100,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 966,
                    height: 74,
                    child: Text(
                      'Organizing your Academic Life has never been Easier\n',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B79F6),
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 692,
                    height: 53,
                    child: Text(
                      'Select your role to begin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF56A4F8),
                        fontSize: 36,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.0,
                      ),
                    ),
                  ),
                  Container(
                    width: 286,
                    height: 102,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFFA373F2)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // Wrap the entire child with GestureDetector
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        studentDash.studentView(context)));
                            print(
                                'Student box tapped!'); // may be removed in final version
                          },
                          child: Container(
                            // Keep the existing container for styling
                            width: 246,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      // ... existing container properties
                                      ),
                                ),
                                Positioned(
                                  left: 18.7,
                                  top: 17,
                                  child: SizedBox(
                                    width: 208.61,
                                    height: 37,
                                    child: Text(
                                      'Student',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //need to add link to admin view
                  Container(
                    height: 110,
                    padding: EdgeInsets.all(20),
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 1, color: Color(0xFF881EC8)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          // Wrap the entire child with GestureDetector
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => instructorDash
                                        .instructorView(context)));
                            print('Instructor box tapped!');
                          },
                          child: Container(
                            // Keep the existing container for styling
                            width: 246,
                            height: 70,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                      // ... existing container properties
                                      ),
                                ),
                                Positioned(
                                  left: 18.7,
                                  top: 17,
                                  child: SizedBox(
                                    width: 208.61,
                                    height: 37,
                                    child: Text(
                                      'Instructor',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 36,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    decoration: ShapeDecoration(
                      color: Color(0xFF8B24C9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      shadows: [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Action when 'Admin' is tapped
                      print('Admin box clicked');
                      // Navigate to another page or show a dialog if needed
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => AdminLoginPage()));
                    },
                    child: SizedBox(
                      width: 147,
                      height: 23,
                      child: Text(
                        'Admin',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
}

class login_signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login_signup(),
    );
  }
}

class LoginCtrl {
  String userRole = "";
  //method to determine role on login
  void determineRole(bool isStudent, bool isInstructor, bool isAdmin) {
    if (isStudent == true) {
      userRole = "IS_STUDENT";
    } else if (isInstructor == true) {
      userRole = "IS_INSTRUCTOR";
    } else if (isAdmin == true) {
      userRole = "IS_ADMIN";
    }
  }
}
