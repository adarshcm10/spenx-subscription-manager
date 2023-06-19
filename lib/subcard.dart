// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class subcard extends StatelessWidget {
  final Name;
  final desc;
  final Rate;
  const subcard({super.key, this.Name, this.desc, this.Rate});

  String findasset() {
    String imx = 'assets/Icons/default.png';
    if (Name == 'Netflix' || Name == 'netflix') {
      imx = 'assets/Icons/Netflix.png';
    } else if (Name == 'prime' || Name == 'Prime') {
      imx = 'assets/Icons/amazon.png';
    } else if (Name == 'spotify' || Name == 'Spotify') {
      imx = 'assets/Icons/spotify.png';
    } else if (Name == 'adobe' || Name == 'Adobe') {
      imx = 'assets/Icons/adobe.png';
    } else if (Name == 'disney' || Name == 'Disney') {
      imx = 'assets/Icons/disney.png';
    }
    return imx;
  }

  String calculateDaysDifference(String date) {
    final now = DateTime.now();
    final dateParts = date.split('-');
    final targetDate = DateTime(
      int.parse(dateParts[2]), // year
      int.parse(dateParts[1]), // month
      int.parse(dateParts[0]), // day
    );

    final difference = targetDate.difference(now).inDays;
    String dtformat;
    if (difference == 1) {
      dtformat = '$difference day';
    } else if (difference == 0) {
      dtformat = 'Today';
    } else {
      if (difference < 0) {
        dtformat = 'Expired';
      } else if (difference > 30) {
        dtformat = 'More than 30 days';
      } else if (difference > 6 && difference < 30) {
        int x = difference ~/ 7;
        int y = difference % 7;
        if (y == 0) {
          dtformat = '$x week';
        } else {
          dtformat = '$x weeks $y days ';
        }
      } else {
        dtformat = '$difference days';
      }
    }
    return dtformat;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(
                    findasset(),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Name,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: 'GothamBold'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text('${calculateDaysDifference(desc)} left',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontFamily: 'GothamMedium')),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      Rate,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 23,
                          fontFamily: 'GothamBold'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
