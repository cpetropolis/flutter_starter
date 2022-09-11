/*
Login screen for the app, which will load if app starts and user is not logged in or on logout
R-Type education Jun 2021
*/

import 'package:flutter/material.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base/components/app_Initializer.dart';
import 'package:flutter_base/screens/password_reset.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
            'Fast Tracker Login',
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
                message, // As required if issues
                style: appBarStyle,
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
              TextField(
                // Input for password
                obscureText: true,
                onChanged: (value) {
                  userPassword = value;
                },
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
                  hintText: 'Password',
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
                    final newLogin = await _auth.signInWithEmailAndPassword(
                        email: userEmail, password: userPassword);

                    // if login successful push to the firebase initializer
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AppInitializer()),
                    );
                  } on FirebaseAuthException catch (e) {
                    // If login failed then we will switch the message, error codes were not stable
                    setState(() {
                      message =
                          "There is an issue with the information entered";
                    });
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
              RoundedButton(
                // Password reset button
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PasswordReset(),
                  ),
                ),
                height: 80,
                colour: submitBoxColor,
                cardChild: Center(
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ]));
  }
}
