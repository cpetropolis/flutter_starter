import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:flutter_base/screens/forgot_password.dart';
import 'package:flutter_base/screens/change_pin.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/screens/main_screen.dart';

class InsertDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> drawerContents = [];
    var globals = context.read<Globals>();

    drawerContents.add(_createHeader()); // add the drawer header

    drawerContents.add(ListTile(
        title: Row(
          children: <Widget>[
            Icon(Icons.people_rounded),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Search Learners'),
            )
          ],
        ),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScreen()))));

    drawerContents.add(ListTile(
      title: Row(
        children: <Widget>[
          Icon(Icons.logout),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text('Log Out'),
          )
        ],
      ),
      onTap: () async {
// logout and go to login screen
        await FirebaseAuth.instance.signOut();
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
      },
    ));

    drawerContents.add(ListTile(
        title: Row(
          children: <Widget>[
            Icon(Icons.password),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text('Change Password'),
            )
          ],
        ),
        onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ForgotPassword(),
              ),
            )));

    return Drawer(
// Add a ListView to the drawer. This ensures the user can scroll
// through the options in the drawer if there isn't enough vertical
// space to fit everything.
      child: Container(
        color: primaryColor,
        child: ListView(
// Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [...drawerContents],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: appBarColor,
        ),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Fast-Tracker \nResident Evaluations",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }
}
