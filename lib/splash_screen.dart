import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreferences/admin_screen.dart';
import 'package:sharedpreferences/home_screen.dart';
import 'package:sharedpreferences/login_screen.dart';
import 'package:sharedpreferences/student_screen.dart';
import 'package:sharedpreferences/teacher_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if (isLogin) {
      if (userType == 'student') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentScreen(),
              ));
        });
      } else if (userType == 'teacher') {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeacherScreen(),
              ));
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminScreen(),
              ));
        });
      }
    } else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
          height: double.infinity,
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://images.pexels.com/photos/7353487/pexels-photo-7353487.jpeg?auto=compress&cs=tinysrgb&w=600")),
    );
  }
}
