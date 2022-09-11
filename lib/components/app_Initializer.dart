/*
The firebase initializer will first run and if the user is authenticated then load
the appropriate user values and then continue to the App. If the user is not logged
in then they will be directed to the login screen.

R-Type education Jun 2021
*/

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_base/components/loading_spinner.dart';
import 'package:flutter_base/screens/error_screen.dart';
import 'package:flutter_base/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:flutter_base/screens/main_screen.dart';

class AppInitializer extends StatefulWidget {
  @override
  _AppInitializerState createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  Widget build(BuildContext context) {
    // The authentication instance stored
    final _auth = FirebaseAuth.instance;
    // storing the authenticated user
    final user = _auth.currentUser;

    // signed in
    if (user != null) {
      // get globals from provider then save the authentication userId
      var globals = context.read<Globals>();
      globals.authId = user.uid;

      return FutureBuilder(
        // Initialize FlutterFire:
        future: dbAccessCheck(),
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            // return ErrorScreen(); todo: needs an error screen
          }

          // Once complete, show your application
          if (snapshot.data == true) {
            return AccessInitializer();
          }
          // Otherwise, show the loading screen
          return LoadingScreen();
        },
      );
    } else {
      // if the user is not logged in then we send them to the login screen
      return LoginScreen();
    }
  }

  //Checking to ensure the overall access to the app isn't set to off

  Future<bool> dbAccessCheck() async {
    bool check = true;

    await FirebaseFirestore.instance
        .collection('appControl')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        check = doc['online'];
      });
    });

    return (check);
  }
}

class AccessInitializer extends StatefulWidget {
  @override
  _AccessInitializerState createState() => _AccessInitializerState();
}

class _AccessInitializerState extends State<AccessInitializer> {
  @override
  Widget build(BuildContext context) {
    var globals = context.read<Globals>();

    return FutureBuilder<bool>(
      future: storeData(globals.authId), // async work
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // return ErrorScreen();
          //todo: error screens
        }
        // Once complete, move on to the resident selector
        if (snapshot.data == true) {
          // If the user is a resident we are going to show them their EPA list

          return MainScreen();
        } //else {
        // return ErrorScreen(); //todo: need error_screen
        // }

        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingScreen();
      },
    );
  }

  Future<bool> storeData(String userId) async {
    // Function will take the authentication userId and use it to find the corresponding record in the firestore
    // database and then save the relavent information into the globals Provider.   W
    var globals = context.read<Globals>();

    bool check = true;
    //
    // await FirebaseFirestore.instance // Get and save user information
    //     .collectionGroup(
    //         'users') // this is done as a collectionGroup across all PGME's so we don't have to have a separate base level user collection
    //     .where('authId', isEqualTo: userId)
    //     .get()
    //     .then((QuerySnapshot querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     globals.example = List.from(doc["example"]);
    //
    //   });
    // });

    return (check); // return once done
  }
}
