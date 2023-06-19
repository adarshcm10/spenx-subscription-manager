// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourWidget extends StatefulWidget {
  final TextEditingController duedt;

  const YourWidget({super.key, required this.duedt});

  @override
  _YourWidgetState createState() => _YourWidgetState();
}

class _YourWidgetState extends State<YourWidget> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.white.withOpacity(0.7),
                onPrimary: Colors.black,
                surface: Colors.white.withOpacity(0.7),
                onSurface: Colors.black,
              ),
              dialogBackgroundColor: Colors.white.withOpacity(0.7),
            ),
            child: child!,
          );
        });

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate!);
        widget.duedt.text = formattedDate
            .toString(); // Update the text field with the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        readOnly: true, // Disable manual editing of the text field
        onTap: () => _selectDate(
            context), // Open the date picker when the text field is tapped
        textCapitalization: TextCapitalization.sentences,
        controller: widget.duedt,
        decoration: InputDecoration(
          hintText: 'Due Date',
          hintStyle: TextStyle(
            fontFamily: 'GothamLight',
            fontSize: 20,
            color: Colors.white.withOpacity(0.7),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.0),
            borderSide: BorderSide(
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        autofocus: false,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
