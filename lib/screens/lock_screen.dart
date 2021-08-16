import 'package:flutter/material.dart';
import 'package:password_manager/components/constants.dart';
import 'package:password_manager/screens/home_screen.dart';
import 'package:get/get.dart';

String password = "";
String correctPin = "786486";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(KBackgroundColors),
      body: Column(
        children: [
          SizedBox(
            height: 40.0,
          ),
          Center(
            child: Container(
              height: 50.0,
              child: Image(image: AssetImage("assets/images/lock2.png")),
            ),
          ),
          SizedBox(height: 80.0),
          Container(
            height: 130.0,
            child: password.length == 0
                ? Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Text(
                      'Enter your 6 digit code',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.grey[700],
                          fontSize: 15.0),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < password.length; i++)
                            Container(
                              width: 46,
                              child: Center(
                                child: Text(
                                  password[i],
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 50.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        'Create a long Password',
                        style: TextStyle(
                          color: Colors.teal,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Numpad(7),
                    Numpad(8),
                    Numpad(9),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Numpad(4),
                    Numpad(5),
                    Numpad(6),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Numpad(1),
                    Numpad(2),
                    Numpad(3),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MaterialButton(
                      splashColor: Colors.black,
                      highlightColor: Colors.green,
                      color: Colors.teal.shade900,
                      minWidth: 85.0,
                      height: 85.0,
                      onPressed: () {
                        if (password == correctPin) {
                          Get.off(HomeScreen());
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset(
                        "assets/images/check.png",
                        scale: 18.0,
                        color: Colors.green,
                      ),
                    ),
                    Numpad(0),
                    MaterialButton(
                      splashColor: Colors.black,
                      highlightColor: Colors.red,
                      color: Color(0XFF342022),
                      minWidth: 85.0,
                      height: 85.0,
                      onPressed: () {
                        if (password.length != 0) {
                          setState(() {
                            password =
                                password.substring(0, password.length - 1);
                          });
                        }
                      },
                      onLongPress: () {
                        if (password.length != 0) {
                          setState(() {
                            password = "";
                          });
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Image.asset(
                        "assets/images/delete.png",
                        scale: 18.0,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Numpad(int n) {
    return MaterialButton(
      splashColor: Colors.black,
      highlightColor: Colors.black,
      color: Color(0X66707070),
      minWidth: 85.0,
      height: 85.0,
      onPressed: () {
        if (password.length < 6) {
          setState(() {
            password = password + '$n';
          });
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Text(
        '$n',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 35.0,
          color: Color(0XFFAAAAAA),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
