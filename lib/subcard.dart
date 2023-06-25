// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';

class subcard extends StatelessWidget {
  final Name;
  final desc;
  final Rate;
  const subcard({super.key, this.Name, this.desc, this.Rate});

  String findasset() {
    String imz = 'assets/Icons/default.png';
    if (Name == 'Netflix' || Name == 'netflix') {
      imz = 'assets/Icons/Netflix.png';
    } else if (Name == 'prime' || Name == 'Prime') {
      imz = 'assets/Icons/amazon.png';
    } else if (Name == 'spotify' || Name == 'Spotify') {
      imz = 'assets/Icons/spotify.png';
    } else if (Name == 'adobe' || Name == 'Adobe') {
      imz = 'assets/Icons/adobe.png';
    } else if (Name == 'disney' || Name == 'Disney') {
      imz = 'assets/Icons/disney.png';
    }
    return imz;
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

  Widget getImageWidget(String name) {
    String imz = 'assets/Icons/default.png';
    if (name == 'Netflix' || name == 'netflix') {
      imz = 'assets/Icons/Netflix.png';
    } else if (name == 'prime' || name == 'Prime') {
      imz = 'assets/Icons/amazon.png';
    } else if (name == 'spotify' || name == 'Spotify') {
      imz = 'assets/Icons/spotify.png';
    } else if (name == 'adobe' || name == 'Adobe') {
      imz = 'assets/Icons/adobe.png';
    } else if (name == 'disney' || name == 'Disney') {
      imz = 'assets/Icons/disney.png';
    }

    return Container(
        child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              width: 50,
              height: 50,
              child: Image.asset(imz),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Text(
              Name,
              style: const TextStyle(
                  color: Colors.black, fontSize: 30, fontFamily: 'GothamBold'),
            ),
          ),
        ]));
  }

  Widget getAlter(String name) {
    String imz = 'assets/alter/default.png';
    String imq = 'assets/alter/default.png';
    if (name == 'Netflix' || name == 'netflix') {
      imz = 'assets/alter/prime.png';
      imq = 'assets/alter/disney.png';
    } else if (name == 'prime' || name == 'Prime') {
      imz = 'assets/alter/netflix.png';
      imq = 'assets/alter/disney.png';
    } else if (name == 'spotify' || name == 'Spotify') {
      imz = 'assets/alter/ytmusic.png';
      imq = 'assets/alter/applemusic.png';
    } else if (name == 'disney' || name == 'Disney') {
      imz = 'assets/alter/netflix.png';
      imq = 'assets/alter/prime.png';
    }

    if (imz == 'assets/alter/default.png') {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imz,
              width: 300,
            ),
          ]);
    } else {
      return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset(
                imz,
                width: 140,
              ),
            ),
            Image.asset(
              imq,
              width: 140,
            ),
          ]);
    }
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 1.3,
            child: Container(
              //height: MediaQuery.of(context).size.height,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Center(
                      child: getImageWidget(Name),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Due on: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'GothamMedium'),
                        ),
                        Text(
                          desc,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'GothamBold'),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Due amount: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: 'GothamMedium'),
                        ),
                        Text(
                          Rate,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'GothamBold'),
                        ),
                      ],
                    ),
                  ),
                  getAlter(Name),
                  //nutton 'close' to close the bottom sheet
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Close',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'GothamMedium'),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(context);
      },
      child: Padding(
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
      ),
    );
  }
}
