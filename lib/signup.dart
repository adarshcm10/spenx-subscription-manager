// ignore_for_file: camel_case_types, library_private_types_in_public_api, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:spenx/home.dart';
import 'package:spenx/signin.dart';
import 'package:spenx/transitions.dart';

class signup extends StatefulWidget {
  signup({super.key});
  final name = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final pass2 = TextEditingController();

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  void validate() {
    if (widget.name.text.isEmpty ||
        widget.pass.text.isEmpty ||
        widget.pass2.text.isEmpty ||
        widget.email.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('One or more fields are empty'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(DissolvePageRoute(
          page: home(
        user: widget.name.text,
      )));
    }
  }

  bool _isObscured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xff080808),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/signupimg.png',
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
                controller: widget.name,
                decoration: InputDecoration(
                  hintText: 'Full name',
                  hintStyle: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: widget.email,
                decoration: InputDecoration(
                  hintText: 'Email address',
                  hintStyle: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
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
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: widget.pass,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
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
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                autofocus: false,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                controller: widget.pass2,
                obscureText: _isObscured,
                decoration: InputDecoration(
                  hintText: 'Re-type Password',
                  hintStyle: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    color: Colors.white.withOpacity(0.7),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 30.0),
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
                  suffixIcon: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      _isObscured ? Icons.visibility_off : Icons.visibility,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                autofocus: false,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  validate();
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(330, 60),
                  backgroundColor: const Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: 'GothamLight',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff080808),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context, SlideRightRoute(page: signin()));
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: const Column(
                  children: [
                    Text(
                      'already have an account?',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'GothamLight',
                        color:
                            Colors.white, // change color to whatever you need
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(
                        'Sign in here',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'GothamBold',
                          color:
                              Colors.white, // change color to whatever you need
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
