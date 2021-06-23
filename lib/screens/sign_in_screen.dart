import 'package:flutter/material.dart';
import 'dart:ui';
import '../utils/authentication.dart';
import '../widgets/sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 56, 74, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/logo1.png',
                        height: 160,
                      ),
                    ),
                    Text(
                      'jusTalk',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 160, 0, 1),
                        fontSize: 45,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(
                    context: context), // initialize firebase
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.lightGreen[700]),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
