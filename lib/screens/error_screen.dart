// /*
// Default screen to handel an error for the user
//
// Christian Petropolis June 2021
//  */
//
// import 'package:flutter/material.dart';
// import 'package:flutter_base/components/rounded_button.dart';
// import 'package:flutter_base/components/constants.dart';
//
// class ErrorScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 80,
//         title: Text('Something went wrong'),
//       ),
//       body: ListView(
//         addRepaintBoundaries: false,
//         shrinkWrap: true,
//         padding: EdgeInsets.all(15),
//         children: [
//           RoundedBox(
//             height: 200,
//             colour: unselectedColor,
//             cardChild: Text(
//                 'We are sorry but there was an error. Please reach out to your administrator'),
//           )
//         ],
//       ),
//     );
//   }
// }
