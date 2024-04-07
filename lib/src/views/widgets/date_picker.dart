import 'package:flutter/material.dart';

class DatePickerExample extends StatefulWidget {
  const DatePickerExample({Key? key}) : super(key: key);

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}

class _DatePickerExampleState extends State<DatePickerExample> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
        ));
      });
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _selectDate(context),
      child: const Text('Open Date Picker'),
    );
  }
}
