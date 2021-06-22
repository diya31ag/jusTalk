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
    // return Scaffold(
    //   backgroundColor: Color.fromRGBO(44, 56, 74, 1),
    //   body: SafeArea(
    //     child: Padding(
    //       padding: const EdgeInsets.only(
    //         left: 35.0,
    //         right: 16.0,
    //         bottom: 20.0,
    //       ),
    //       child: Column(
    //         mainAxisSize: MainAxisSize.max,
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           Expanded(
    //               child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Flexible(
    //                 flex: 1,
    //                 child: Image.asset(
    //                   'assets/logo.png',
    //                   height: 30,
    //                 ),
    //               ),
    //               SizedBox(height: 20),
    //               Text('jusTalk',
    //                   style: TextStyle(
    //                     color: Color.fromRGBO(3, 155, 229, 1),
    //                     fontSize: 40,
    //                   )),
    //             ],
    //           )),
    //           // FutureBuilder(
    //           //   future: Authentication.initializeFirebase(),
    //           //   builder: (BuildContext context, AsyncSnapshot snapshot) {
    //           //     if (snapshot.hasError) {
    //           //       return Text('Error initializing Firebase');
    //           //     } else if (snapshot.connectionState == ConnectionState.done) {
    //           //       return GoogleSignInButton();
    //           //     }
    //           //     return CircularProgressIndicator(
    //           //       valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
    //           //     );
    //           //   },
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
                    // SizedBox(height: 5),
                    Text(
                      'jusTalk',
                      style: TextStyle(
                        // color: CustomColors.firebaseYellow,
                        color: Color.fromRGBO(255, 160, 0, 1),
                        fontSize: 45,
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        // CustomColors.firebaseOrange,
                        Colors.lightGreen[700]),
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
