/*
Login screen for the app, which will load if app starts and user is not logged in or on logout
R-Type education Jun 2021
*/

import 'package:flutter/material.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:password/password.dart';

class ChangePin extends StatefulWidget {
  @override
  _ChangePinState createState() => _ChangePinState();
}

class _ChangePinState extends State<ChangePin> {
  // Create and store FirebaseAuth instance for later use
  final _auth = FirebaseAuth.instance;

  // For eventual storage of entered username and password
  late String userPassword = '';
  late String newPin = '';
  late String confirmPin = '';

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
            'Change Pin',
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
                'Enter your password to change your pin', // As required if issues
                style: descriptionStyle,
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // Input for email
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
                  hintText: 'Current Password',
                  hintStyle: textFieldStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                // Input for email
                obscureText: true,
                onChanged: (value) {
                  newPin = value;
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
                  hintText: 'New Pin',
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
                  confirmPin = value;
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
                  hintText: 'Confirm New Pin',
                  hintStyle: textFieldStyle,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              RoundedButton(
                // Submit button
                onPress: () => submitPin(userPassword, newPin, confirmPin),
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
              Text(
                message, // As required if issues
                style: errorTextStyle,
              ),
            ]));
  }

  Future<void> submitPin(
      String userPassword, String newPin, String confirmPin) async {
    var globals = context.read<Globals>();

    if (newPin != confirmPin || newPin == '') {
      setState(() {
        message = "Your entered pins do not match or are unset";
      });
    } else {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
          email: globals.userEmail, password: userPassword);

      //todo: set the path for the pin to implement
// Reauthenticate
//       await FirebaseAuth.instance.currentUser!
//           .reauthenticateWithCredential(credential)
//           .then((value) {
//         CollectionReference pinReference = FirebaseFirestore.instance
//             .collection('PGME')
//             .doc(globals.pgmeId)
//             .collection('users')
//             .doc(globals.userId)
//             .collection('pin');
//
//         pinReference.get().then((QuerySnapshot querySnapshot) {
//           querySnapshot.docs.forEach((doc) async {
//             pinReference
//                 .doc(doc.id)
//                 .update({'pin': Password.hash(newPin, PBKDF2())}).then((value) {
//               Navigator.of(context).popUntil((route) => route.isFirst);
//             }).catchError((error) {
//               setState(() {
//                 message = "Failed to update pin: $error";
//               });
//             });
//           });
//         });
//       }).catchError((error) {
//         setState(() {
//           message = "Failed to update pin: $error";
//         });
//       });
//     }
    }
  }
}
