import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<DateTime> days = [];

  List<DateTime> dates = [
    DateTime.parse("2022-08-02"),
    DateTime.parse("2022-08-05"),
    DateTime.parse("2022-08-08"),
  ];
  final TextEditingController _eventController = TextEditingController();

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // getDaysInBeteween(
    //     DateTime.now(), DateTime.now().add(const Duration(days: 3)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: 400,
      height: 300,
      child: Dialog(
        child: SfDateRangePicker(
          view: DateRangePickerView.month,
          monthViewSettings:
              DateRangePickerMonthViewSettings(specialDates: dates),
          // backgroundColor: Colors.blue,

          monthCellStyle: DateRangePickerMonthCellStyle(
            blackoutDatesDecoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: const Color(0xFFF44436), width: 1),
                shape: BoxShape.circle),
            specialDatesDecoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: const Color(0xFF2B732F), width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: const TextStyle(
                color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }
}
