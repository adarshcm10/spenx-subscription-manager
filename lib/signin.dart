import 'package:flutter/material.dart';
import 'package:spenx/signup.dart';
import 'package:spenx/transitions.dart';

import 'home.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff080808),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                ),
                child: Image.asset(
                  'assets/logo-signin.png',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
              child: TextField(
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
            const PasswordTextField(),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Container(
                alignment: AlignmentDirectional.centerStart,
                child: TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.resolveWith<Color>(
                      (states) => Colors.transparent,
                    ),
                  ),
                  onPressed: () {
                    // Add your onPressed code here
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'GothamLight',
                      color: Colors.white, // change color to whatever you need
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(DissolvePageRoute(
                      page: home(
                    user: 'adarsh',
                  )));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(330, 60),
                  backgroundColor: Color(0xffffffff),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Sign In',
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
                      context, EnterRoute(page: signup()));
                },
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.resolveWith<Color>(
                    (states) => Colors.transparent,
                  ),
                ),
                child: Column(
                  children: const [
                    Text(
                      'don\'t have an account?',
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
                        'Create account',
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

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isObscured = true;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: TextField(
        controller: _textEditingController,
        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(
            fontFamily: 'GothamLight',
            fontSize: 20,
            color: Colors.white.withOpacity(0.7),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
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
    );
  }
}
