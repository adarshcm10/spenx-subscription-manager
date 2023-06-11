// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:spenx/signin.dart';
import 'package:spenx/transitions.dart';

class getstarted extends StatefulWidget {
  const getstarted({super.key});

  @override
  State<getstarted> createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff080808),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 66,
                right: 33,
              ),
              child: Image.asset('assets/logo-gtstrt.png'),
            ),
            const Text(
              'Get your\nsubscriptions\nmanaged with\nease.',
              //maxLines: 20,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'GothamBold',
                color: Color(0xffffffff),
                fontSize: 40,
                letterSpacing: -2.0,
                height: 1.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(EnterRoute(page: signin()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 60),
                  backgroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff080808),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
