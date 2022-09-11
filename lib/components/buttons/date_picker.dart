import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:flutter_base/components/design/constants.dart';

class DatePicker extends StatefulWidget {
  DatePicker({required this.displayText});

  final displayText;

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime _selectedDate;

  void initState() {
    super.initState();

    var globals = context.read<Globals>();
    _selectedDate = globals.eventDate;
  }

  @override
  Widget build(BuildContext context) {
    var globals = context.read<Globals>();
    return RoundedButton(
      height: 50,
      colour: unselectedColor,
      cardChild: Center(
        child: Text(
          widget.displayText +
              ' - ' +
              _selectedDate.day.toString() +
              '/' +
              _selectedDate.month.toString() +
              '/' +
              _selectedDate.year.toString(),
          style: textFieldStyle,
        ),
      ),
      onPress: openDatePicker,
    );
  }

  void openDatePicker() {
    showDatePicker(
            context: context,
            initialDate: _selectedDate,
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          var globals = context.read<Globals>();
          globals.eventDate = pickedDate;
          _selectedDate = pickedDate;
        });
      }
    });
  }
}
