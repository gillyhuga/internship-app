import 'package:flutter/material.dart';
import 'package:interneed/color.dart';
import 'package:interneed/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/dataUser.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var validasi = false;
  TextEditingController _username = TextEditingController();
  TextEditingController _pass = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(35),
              child: Column(
                
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(
                            fontSize: 28,
                            color: textColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Hunters",
                            style: TextStyle(
                              fontSize: 28,
                              color: mainColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Login with the your account or with your social media",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 16,
                              color: textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        TextField(
                            controller: _username,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: secondaryColor,
                              hintText: 'Username',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "Password",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        TextField(
                            obscureText: true,
                            controller: _pass,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: secondaryColor,
                              hintText: 'Password',
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide.none,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Visibility(
                      visible: validasi,
                      child: Text(
                        'Username atau Password tidak cocok !',
                        style: TextStyle(color: Colors.red),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 8.0),
                        child: Column(
                          children: [
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                fontSize: 16,
                                color: textColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(10)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(mainColor),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                            ),
                            onPressed: _login,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: textColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "Sign Up ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: mainColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
     
    );
  }

  Future<void> _login() async {
    if (_username.text.isNotEmpty && _pass.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      SharedPreferences prefs = await SharedPreferences.getInstance();
      Future.delayed(Duration(seconds: 1), () {
        for (int id = 0; id < dataUser.length; id++) {
          if (_username.text == dataUser[id]["UserName"] &&
              _pass.text == dataUser[id]["PassWord"]) {
            String fullname = dataUser[id]["FullName"];
            String username = dataUser[id]["UserName"];
            prefs.setBool('user', true);
            prefs.setString('username', username);
            prefs.setString('fullname', fullname);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Dashboard()));
          } else {
            setState(() {
              validasi = true;
            });
          }
        }
      });
    }
  }
}
