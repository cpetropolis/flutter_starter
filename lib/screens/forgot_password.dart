/*
Login screen for the app, which will load if app starts and user is not logged in or on logout
R-Type education Jun 2021
*/

import 'package:flutter/material.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base/components/app_Initializer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:flutter_base/screens/login_screen.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Create and store FirebaseAuth instance for later use
  final _auth = FirebaseAuth.instance;

  // For eventual storage of entered username and password
  late String password;
  late String confirmPassword;

  // To store error message if required
  String message = '';

  @override
  Widget build(BuildContext context) {
    var globals = context.read<Globals>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                onPressed: () =>
                    Navigator.of(context).popUntil((route) => route.isFirst),
                icon: Icon(Icons.home))
          ],
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          toolbarHeight: 80, // Todo: Should probably switch this to a constant
          title: Text(
            'Change Password',
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
                'Click here to send a password reset link to your registered email address. This will log you out of FastTracker',
                style: descriptionStyle,
              ),
              SizedBox(
                height: 10,
              ),
              RoundedButton(
                // Submit button
                onPress: () async {
                  try {
                    await _auth.sendPasswordResetEmail(
                        email: globals.userEmail);
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
                    'Send Reset Email',
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
