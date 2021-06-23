import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../screens/profile.dart';
import 'call_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:permission_handler/permission_handler.dart';
import '../screens/call_page.dart';

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

  final channelController = TextEditingController();
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
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MakeCall()));
                  },
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
              SizedBox(height: 40.0),

              //list all available channels
              StreamBuilder<QuerySnapshot>(
                  stream:
                      FirebaseFirestore.instance.collection('call').snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return new CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        );
                      default:
                        return SizedBox(
                          height: 100,
                          child: new ListView(
                            children: snapshot.data.docs
                                .map((DocumentSnapshot document) {
                              // avoid listing other users channel
                              if (document['emailCalled'] != _user.email)
                                return Text('');
                              return new Card(
                                  elevation: 5.0,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  color: Color.fromRGBO(22, 31, 43, 1),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 15.0),
                                      child: Row(
                                        children: [
                                          // display calling user details
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(document['name'],
                                                    style: TextStyle(
                                                        fontFamily: 'Nunito',
                                                        fontSize: 20.0)),
                                                Text(document['emailCaller'],
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400])),
                                              ],
                                            ),
                                          ),
                                          // Join channel widget
                                          Expanded(
                                              flex: 2,
                                              child: FlatButton(
                                                color: Colors.red,
                                                child: Text(
                                                  'Join Channel',
                                                  textAlign: TextAlign.end,
                                                ),
                                                onPressed: () {
                                                  onJoin(
                                                      channelName: document[
                                                          'channelName']);
                                                },
                                              )),
                                        ],
                                      )));
                            }).toList(),
                          ),
                        );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin({String channelName}) async {
    setState(() {
      channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    // handle camera and mic permissions
    await _handleCameraAndMic(Permission.camera);
    await _handleCameraAndMic(Permission.microphone);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(channelName: channelName),
        ));
  }

  Future<void> _handleCameraAndMic(Permission permission) async {
    final status = await permission.request();
    print(status);
  }
}
