/*
Base system for building flutter apps

R-Type education Jun 2021
 */
// @dart=2.9

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_base/firebase_options.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/components/app_Initializer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Provider starts at the bottom of the stack. This will contain all of our globals used in the app, stored in the globals.
    return ChangeNotifierProvider(
      create: (context) => Globals(),
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
            //defined colours found in constants.dart
            primaryColor: primaryColor,
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: AppBarTheme(
              elevation: 0, // This removes the shadow from all App Bars.
            )),
        home: AppInitializer(),
        routes: <String, WidgetBuilder>{
          '/login': (BuildContext context) => new LoginScreen(),
        },
      ),
    );
  }
}
