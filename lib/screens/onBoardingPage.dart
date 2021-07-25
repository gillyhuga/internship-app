import 'package:flutter/material.dart';
import 'package:interneed/color.dart';
import 'package:interneed/screens/loginPage.dart';

class OnBoardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 35),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 35, 35, 0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Find",
                            style: TextStyle(
                              fontSize: 28,
                              color: textColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Professional ",
                              style: TextStyle(
                                fontSize: 28,
                                color: mainColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Internship",
                            style: TextStyle(
                              fontSize: 28,
                              color: mainColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Experience",
                              style: TextStyle(
                                fontSize: 28,
                                color: textColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Image.asset('assets/images/wfh_1.png',
                      width: 500, height: 350, fit: BoxFit.fill),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                  child: Text(
                    "Challage yourself towards your future dream job and get bunch of benefits",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: textColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          child: Text(
                            "Let's Go",
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          }),
                    ),
                  ]),
                )
              ],
            ),
          ),
        ),
      );
    
  }
}
