/*
Login screen for the app, which will load if app starts and user is not logged in or on logout
R-Type education Jun 2021
*/

import 'package:flutter/material.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base/components/app_Initializer.dart';
import 'package:flutter_base/screens/login_screen.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  // Create and store FirebaseAuth instance for later use
  final _auth = FirebaseAuth.instance;

  // For eventual storage of entered username and password
  late String userEmail;
  late String userPassword;

  // To store error message if required
  String message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80, // Todo: Should probably switch this to a constant
          title: Text(
            'Fast Tracker Password Reset',
            style: appBarStyle,
          ),
          backgroundColor: appBarColor,
        ),
        body: ListView(
            addRepaintBoundaries: false,
            shrinkWrap: true,
            padding: EdgeInsets.all(15),
            children: [
              Text(
                "Enter your email to receive a reset link", // As required if issues
                style: appBarStyle,
              ),
              Text(
                message, // As required if issues
                style: errorTextStyle,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // Input for email
                onChanged: (value) {
                  userEmail = value;
                },
                keyboardType: TextInputType.emailAddress,
                style: textFieldStyle,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  fillColor: loginFieldColor,
                  hintText: 'Email',
                  hintStyle: textFieldStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                // Submit button
                onPress: () async {
                  try {
                    await _auth.sendPasswordResetEmail(email: userEmail);

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return LoginScreen();
                      }),
                    );
                  } catch (e) {
                    // If login failed then sort the error code and build an appropriate message
                    print(e);
                  }
                },
                height: 80,
                colour: submitBoxColor,
                cardChild: Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ]));
  }
}
