// ignore_for_file: camel_case_types, file_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:spenx/services/notif_service.dart';
import 'package:flutter/cupertino.dart';

import 'datepick.dart';

class addDialogue extends StatefulWidget {
  final subname;
  final duedt;
  final price;
  VoidCallback onSave;
  addDialogue(
      {super.key,
      required this.subname,
      required this.duedt,
      required this.price,
      required this.onSave});

  @override
  State<addDialogue> createState() => _addDialogueState();
}

class _addDialogueState extends State<addDialogue> {
  void validate() {
    if (widget.subname.text.isEmpty ||
        widget.price.text.isEmpty ||
        widget.duedt.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Subscription fields can\'t be empty'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      widget.onSave();
      var subname1 = widget.subname.text;
      var descp = widget.duedt.text;
      var price = widget.price.text;
      NotificationService().showNotification(
          title: "Expire soon!",
          body: subname1 + " is due " + descp + " with \$" + price);
      widget.subname.clear();
      widget.duedt.clear();
      widget.price.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      backgroundColor: const Color.fromARGB(255, 19, 19, 19),
      title: const Text(
        'Add Subscription',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'GothamBold',
          fontSize: 20,
        ),
      ),
      content: SizedBox(
        height: 170,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: widget.subname,
                decoration: InputDecoration(
                  hintText: 'Subscription Name',
                  hintStyle: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
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
            ),
            YourWidget(
              duedt: widget.duedt,
            ),
            TextField(
              keyboardType: TextInputType.number,
              controller: widget.price,
              decoration: InputDecoration(
                hintText: 'Price',
                hintStyle: TextStyle(
                  fontFamily: 'GothamLight',
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.7),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
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
          ],
        ),
      ),
      actions: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    validate();
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'GothamBold',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: SizedBox(
                height: 40,
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'GothamBold',
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
