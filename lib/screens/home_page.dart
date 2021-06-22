import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/sign_in_screen.dart';
import '../utils/authentication.dart';
import '../screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, User user})
      : _user = user,
        super(key: key);

  final User _user;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User _user;
  bool isSigningOut = false;

  @override
  void initState() {
    _user = widget._user;

    super.initState();
  }

  final myController = TextEditingController();
  bool _validateError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(44, 56, 74, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(255, 160, 0, 1),
        title: Text(
          'jusTalk',
          style: TextStyle(
              color: Color.fromRGBO(44, 56, 74, 1),
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w800),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.person),
              color: Color.fromRGBO(44, 56, 74, 1),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      user: _user,
                    ),
                  ),
                );
              })
        ],
        leading: IconButton(
          icon: Image.asset('assets/logo2.png'),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Color.fromRGBO(255, 160, 0, 1),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Text(
                'Make A Video Call',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(44, 56, 74, 1),
                  letterSpacing: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
