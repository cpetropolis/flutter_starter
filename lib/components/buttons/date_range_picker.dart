import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_base/components/globals.dart';
import 'package:flutter_base/components/buttons/rounded_button.dart';
import 'package:flutter_base/components/design/constants.dart';
import 'package:intl/intl.dart';

class DateRangePicker extends StatefulWidget {
  DateRangePicker({required this.lastReviewDate});
  @override
  DateTime lastReviewDate;

  _DateRangePickerState createState() => _DateRangePickerState();
}

class _DateRangePickerState extends State<DateRangePicker> {
  late DateTimeRange selectedDateRange;

  @override
  void initState() {
    super.initState();

    selectedDateRange =
        DateTimeRange(start: widget.lastReviewDate, end: DateTime.now());
  }

  Widget build(BuildContext context) {
    return RoundedButton(
      height: 75,
      colour: unselectedColor,
      cardChild: Center(
        child: Text(
          'Assessment date range:\n' +
              DateFormat.yMMMd().format(selectedDateRange.start) +
              ' to ' +
              DateFormat.yMMMd().format(selectedDateRange.end),
          style: textFieldStyle,
        ),
      ),
      onPress: openDatePicker,
    );
  }

  void openDatePicker() {
    showDateRangePicker(
            context: context,
            initialDateRange: selectedDateRange,
            firstDate: DateTime(2010),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate != null) {
        setState(() {
          var globals = context.read<Globals>();
          selectedDateRange = pickedDate;
        });
      }
    });
  }
}
