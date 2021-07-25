import 'package:flutter/material.dart';
import 'package:interneed/screens/onBoardingPage.dart';
import 'package:interneed/screens/dashboard.dart';
import 'package:interneed/color.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  final bool user;
  SplashScreen(this.user);
  
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  startSplashScreen() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (c) => widget.user ?  Dashboard() : OnBoardingPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Text(
            "Interneed",
            style: TextStyle(
              fontSize: 40,
              color: mainColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ));
  }
  }