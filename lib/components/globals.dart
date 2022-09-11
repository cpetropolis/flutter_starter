import 'package:flutter/material.dart';

class Globals extends ChangeNotifier {
  // user variables

  late String authId;
  late String userEmail;

  late DateTime eventDate = DateTime.now();
}
