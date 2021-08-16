import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:password_manager/components/constants.dart';
import 'package:password_manager/controllers/pswd_controller.dart';
import 'package:password_manager/models/password.dart';

class AddPassword extends StatelessWidget {
  final Password oldPassword;
  AddPassword({this.oldPassword});

  @override
  Widget build(BuildContext context) {
    final pswdController = Get.find<PswdController>();
    final newPassword = Password();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(KBackgroundColors),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.settings,
                      color: Colors.white38,
                    ),
                  ),
                  Text(
                    'Add a Password',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: 'Ubuntu',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        pswdController.addPassword(newPassword);
                        Get.back();
                      },
                      icon: Icon(Icons.check, color: Colors.green)),
                ],
              ),
              SizedBox(height: 20.0),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'WEBSITE',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.grey[600],
                          fontSize: 15.0),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        suffix: IconButton(
                          icon: Icon(Icons.close_rounded, color: Colors.grey),
                          onPressed: () {},
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[700], width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 2.0),
                        ),
                        hintText: "Google",
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (val) {
                        newPassword.appName = val;
                      },
                      validator: (val) {
                        if (val.trim().isEmpty) {
                          return "Enter A Value !";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'EMAIL/USERNAME',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.grey[600],
                          fontSize: 15.0),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        suffix: IconButton(
                          icon: Icon(Icons.close_rounded, color: Colors.grey),
                          onPressed: () {},
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[700], width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 2.0),
                        ),
                        hintText: "Google",
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (val) {
                        newPassword.uname = val;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {
                        if (val.trim().isEmpty) {
                          return "Enter A Value !";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'PASSWORD',
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.grey[600],
                          fontSize: 15.0),
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        suffix: IconButton(
                          icon: Icon(Icons.visibility_outlined,
                              color: Colors.grey),
                          onPressed: () {},
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey[700], width: 2.0),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white60, width: 2.0),
                        ),
                        hintText: "Google",
                      ),
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontFamily: 'Ubuntu',
                        fontWeight: FontWeight.bold,
                      ),
                      onChanged: (val) {
                        newPassword.psswd = val;
                      },
                      validator: (val) {
                        if (val.trim().isEmpty) {
                          return "Enter A Value !";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Center(
                          child: Text(
                            'Generate a Password',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                              fontFamily: 'Ubuntu',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey[850]),
                          alignment: Alignment.center,
                          fixedSize: MaterialStateProperty.all(Size(400, 50)),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
