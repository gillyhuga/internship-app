import 'package:flutter/material.dart';
import 'package:interneed/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp>{
  
  bool user = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

 void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('user') != null) {
      setState(() {
        user = prefs.getBool('user');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Avenir",
      ),
      title: 'Interneed',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(user),
    );
  }
}