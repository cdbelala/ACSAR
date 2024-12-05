import 'package:flutter/material.dart';
import 'package:acsar/src/User Interfaces/studentView.dart';
import 'package:acsar/src/User Interfaces/instructorView.dart';
import 'package:acsar/src/User Interfaces/adminView.dart';

class ChooseLogin extends StatelessWidget {
  ChooseLogin({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container();
  }

  String role = "";

  ManageCourseInfo manageCourseInfo = ManageCourseInfo();
  Widget login(BuildContext context) => Container(
        width: 1440,
        height: 1024,
        decoration: BoxDecoration(
          color: Color(0xFFF5F5DC), // Beige background color
          image: DecorationImage(
            image: NetworkImage("https://via.placeholder.com/1440x1024"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.transparent.withOpacity(0.3), // Overlay effect
              BlendMode.srcOver,
            ),
          ),
        ),
        child: Stack(
          children: [
            // Welcome Header and Text
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Text(
                    'WELCOME TO ACSAR',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF4B0082), // Deep purple text
                      fontSize: 60,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Organizing your Academic Life has never been Easier',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF5D3FD3), // Soft purple text
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Select your role to begin',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF7B68EE), // Lighter purple text
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Student Button
            Positioned(
              top: 300,
              left: MediaQuery.of(context).size.width / 2 - 143,
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    role = 'IS_STUDENT';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Student.studentView(context),
                      ),
                    );
                  },
                  child: _buildButton('Student'),
                ),
              ),
            ),

            // Instructor Button
            Positioned(
              top: 400,
              left: MediaQuery.of(context).size.width / 2 - 143,
              child: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    role = 'IS_INSTRUCTOR';
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            manageCourseInfo.instructorInterface(context),
                      ),
                    );
                  },
                  child: _buildButton('Instructor'),
                ),
              ),
            ),

            // Admin Button
            Positioned(
              bottom: 20,
              left: 20,
              child: GestureDetector(
                onTap: () {
                  role = 'IS_ADMIN';
                  // Navigate to Admin view
                },
                child: _buildButton('Admin'),
              ),
            ),
          ],
        ),
      );

  Widget _buildButton(String label) {
    return Container(
      width: 286,
      height: 70,
      decoration: BoxDecoration(
        color: Color(0xFF8B24C9), // Purple button color
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

/*
class LoginSignup extends StatelessWidget {
  @override
  LoginSignup({Key? key}) : super(key: key);
  Widget logInPage(BuildContext context) {
    return Scaffold(
        //body: ChooseLogin.build(context), //display login page
        );
  }
}
*/
