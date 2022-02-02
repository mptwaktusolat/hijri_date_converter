import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';

class HijriDateConvert extends StatefulWidget {
  const HijriDateConvert({Key? key}) : super(key: key);

  @override
  _HijriDateConvertState createState() => _HijriDateConvertState();
}

class _HijriDateConvertState extends State<HijriDateConvert> {
  final String _myFormat = 'dd MMMM yyyy';
  DateTime _myDate = DateTime.now();
  int _offsetDay = 0;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(12),
            focusColor: Colors.grey.shade100,
            onTap: () async {
              DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: _myDate,
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)));
              setState(() {
                if (selectedDate != null) _myDate = selectedDate;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(DateFormat(_myFormat).format(_myDate),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 24)),
            ),
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _offsetDay = _offsetDay - 1;
                    });
                  },
                  icon: const Icon(Icons.remove),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  margin: const EdgeInsets.all(6),
                  color: Colors.grey.shade50,
                  child: Text(
                    _offsetDay.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: _offsetDay < 0 ? Colors.red : Colors.green),
                  ),
                ),
              ),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      _offsetDay = _offsetDay + 1;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              const Spacer(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
                HijriCalendar.fromDate(_myDate.add(Duration(days: _offsetDay)))
                    .toFormat(_myFormat),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}
