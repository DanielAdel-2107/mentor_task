import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_task/views/clipper/frist_clipper.dart';
import 'package:mentor_task/views/clipper/second_clipper.dart';
import 'package:mentor_task/views/screens/sign_in_screen.dart';
import 'package:mentor_task/views/screens/sign_up_screen.dart';
import 'package:mentor_task/views/widgets/custom_button.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ClipPath(
            clipper: FirstClipper(),
            child: Container(
              color: Colors.blueAccent,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          ClipPath(
            clipper: SecondClipper(),
            child: Container(
              alignment: Alignment.center,
              color: Colors.lightBlue,
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              child: Text(
                'Welcome to\nMentor Academy!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Qwitcher_Grypen'),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Welcome to Our App!',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomButton(
                      text: 'Sign In',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                      })),
              const SizedBox(height: 10),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomButton(
                      text: 'Sign Up',
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      })),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
