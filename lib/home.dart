// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:spenx/addDialogue.dart';
import 'package:spenx/getstarted.dart';
import 'package:spenx/services/notif_service.dart';
import 'package:spenx/subcard.dart';
import 'package:spenx/transitions.dart';

class home extends StatefulWidget {
  String user;
  home({super.key, required this.user});
  final subname = TextEditingController();
  final duedt = TextEditingController();
  final price = TextEditingController();
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List subscriptions = [];

  double totalExpense() {
    double total = 0;
    for (int i = 0; i < subscriptions.length; i++) {
      String amountString = subscriptions[i][2];
      try {
        // Remove any non-numeric characters except the decimal point
        amountString = amountString.replaceAll(RegExp(r'[^\d.]'), '');

        // Parse the amount as a double value
        double amount = double.parse(amountString);

        // Round the amount to two decimal places
        amount = double.parse(amount.toStringAsFixed(2));

        total += amount;
      } catch (e) {
        print('Error parsing amount: $amountString');
      }
    }
    return total;
  }

  void paid(int index) {
    int indexToMove = index; // Index of the row to move to the end

    List<String> sublistToMove =
        subscriptions[indexToMove]; // Extract the sublist to move

    subscriptions
        .removeAt(indexToMove); // Remove the sublist from the original position
    subscriptions.add(sublistToMove); // Add the sublist at the end of the list
  }

  void changedate(int index) {
    String dateStr = subscriptions[index][1]; // Assuming "dd-mm-yyyy" format

    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateTime oldDate = inputFormat.parse(dateStr);

    DateTime newDate = oldDate.add(const Duration(days: 30));

    DateFormat outputFormat = DateFormat('dd-MM-yyyy');
    String updatedDateStr = outputFormat.format(newDate);

    subscriptions[index][1] = updatedDateStr;
  }

  String monthYear() {
    var now = DateTime.now();
    var formatter = DateFormat('MMMM yyyy');
    var formattedDate = formatter.format(now);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    double expense = totalExpense();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff080808),
      appBar: AppBar(
        backgroundColor: Color(0xff080808),
        centerTitle: true,
        title: Image.asset('assets/appbarlogo.png'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => addDialogue(
                        subname: widget.subname,
                        duedt: widget.duedt,
                        price: widget.price,
                        onSave: () {
                          setState(() {
                            subscriptions.add([
                              widget.subname.text,
                              widget.duedt.text,
                              "\$" + widget.price.text,
                            ]);
                          });
                          Navigator.pop(context);
                        }));
              },
              child: Image.asset('assets/Icons/plus.png'),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xff100F0F),
        child: ListView(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/menulogo.png',
                  alignment: Alignment.topLeft,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: FloatingActionButton(
                      backgroundColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset('assets/menuclose.png')),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Column(
                children: [
                  ListTile(
                      title: const Text(
                        'My Subscriptions',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GothamBold',
                            fontSize: 23),
                      ),
                      onTap: () {
                        //Navigator.push(context, SlideRightRoute(page: home()));
                      }),
                  ListTile(
                      title: const Text(
                        "Monthly Report",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GothamBold',
                            fontSize: 23),
                      ),
                      onTap: () {
                        //Navigator.push(context, SlideRightRoute(page: home()));
                      }),
                  ListTile(
                      title: const Text(
                        "Profile",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GothamBold',
                            fontSize: 23),
                      ),
                      onTap: () {
                        //Navigator.push(context, SlideRightRoute(page: home()));
                      }),
                  ListTile(
                      title: const Text(
                        "Sign Out",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'GothamBold',
                            fontSize: 23),
                      ),
                      onTap: () {
                        Navigator.push(
                            context, FadeRoute(page: const getstarted()));
                      }),
                ],
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'Hii ${widget.user},',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'GothamBold',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Text(
                'Total dues in \n${monthYear()}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'GothamLight',
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              '\$$expense',
              style: TextStyle(
                fontFamily: 'GothamBold',
                color: Colors.white,
                fontSize: 70,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 20),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                  ),
                ),
                onPressed: () {
                  NotificationService().showNotification(
                      title: 'Sample title', body: 'It works!');
                },
                child: Text(
                  'View Report',
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xff080808),
                      fontFamily: 'GothamBold'),
                )),
          ),
          //if subscriptions list is empty, display a sized box else diaplay the list
          subscriptions.isEmpty
              ? Container(
                  //border radius of 20
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff495057),
                  ),
                  width: 296,
                  //height of 50% to device height
                  height: MediaQuery.of(context).size.height * 0.5,
                  //place Image.asset('assets/empty.png'), at center of cintainer
                  child: Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            'No Subscriptions\nto display.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'GothamBold',
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: //button calling addDialogue
                                ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Colors.white),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) => addDialogue(
                                              subname: widget.subname,
                                              duedt: widget.duedt,
                                              price: widget.price,
                                              onSave: () {
                                                setState(() {
                                                  subscriptions.add([
                                                    widget.subname.text,
                                                    widget.duedt.text,
                                                    "\$${widget.price.text}",
                                                  ]);
                                                });
                                                Navigator.pop(context);
                                              }));
                                    },
                                    child: Text(
                                      'Add Subscription',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xff080808),
                                          fontFamily: 'GothamBold'),
                                    )),
                          ),
                        )
                      ],
                    ),
                  ))
              : Expanded(
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: subscriptions.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          startActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                label: 'Mark as Paid',
                                icon: Icons.star,
                                //height of 50

                                //border radius of 20
                                borderRadius: BorderRadius.circular(10),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 67, 67, 67),
                                onPressed: (context) => {
                                  setState(() {
                                    changedate(index);
                                    paid(index);
                                  }),
                                },
                              ),
                            ],
                          ),
                          endActionPane: ActionPane(
                            motion: const DrawerMotion(),
                            children: [
                              SlidableAction(
                                label: 'Delete',
                                icon: Icons.delete,
                                borderRadius: BorderRadius.circular(10),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 67, 67, 67),
                                onPressed: (context) => {
                                  setState(() {
                                    subscriptions.removeAt(index);
                                  })
                                },
                              ),
                            ],
                          ),
                          child: subcard(
                            Name: subscriptions[index][0],
                            desc: subscriptions[index][1],
                            Rate: subscriptions[index][2],
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
