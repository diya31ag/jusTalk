import 'package:flutter/material.dart';
import 'screens/sign_in_screen.dart';

void main() {
  runApp(jusTalk());
}

class jusTalk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'video meeting app',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        brightness: Brightness.dark,
      ),
      home: SignInScreen(),
    );
  }
}
