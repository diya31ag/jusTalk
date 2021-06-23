import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'call_page.dart';
import '../utils/firestore_collection.dart';

class MakeCall extends StatefulWidget {
  @override
  _MakeCallState createState() => _MakeCallState();
}

class _MakeCallState extends State<MakeCall> {
  final channelController = TextEditingController(); // store channel name
  final emailController =
      TextEditingController(); // stores email of the person to be called
  bool _validateError = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Image.asset('assets/logo1.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Text(
                  'jusTalk',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                  // email input field
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Called Person Email',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(255, 160, 0, 1)),
                      hintText: 'test',
                      hintStyle: TextStyle(color: Colors.black45),
                      errorText: _validateError
                          ? 'Called person email is mandatory'
                          : null,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 20)),
                Container(
                  // channel name input field
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    controller: channelController,
                    decoration: InputDecoration(
                      labelText: 'Channel Name',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(255, 160, 0, 1)),
                      hintText: 'test',
                      hintStyle: TextStyle(color: Colors.black45),
                      errorText:
                          _validateError ? 'Channel name is mandatory' : null,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromRGBO(255, 160, 0, 1)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 30)),
                Container(
                  // join button
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: MaterialButton(
                    onPressed: onJoin,
                    height: 40,
                    color: Color.fromRGBO(255, 160, 0, 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Join',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    setState(() {
      channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });

    await setCall(
        email: emailController.text,
        channelName: channelController
            .text); // channel name and user details added to firebase

    // asking premissions to use camera and microphone
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: channelController.text),
        ));
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
