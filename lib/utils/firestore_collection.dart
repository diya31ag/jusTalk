import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// user collection
final CollectionReference userCollection =
    FirebaseFirestore.instance.collection('user');

// call collection
final CollectionReference callCollection =
    FirebaseFirestore.instance.collection('call');
User user = FirebaseAuth.instance.currentUser;

// set data to user collection
Future<void> setUser({User user}) async {
  try {
    await userCollection
        .doc(user.uid)
        .set({
          'uid': user.uid,
          'email': user.email,
          'name': user.displayName,
        })
        .then((value) => null)
        .catchError((e) => print(e));
  } catch (e) {
    print(e);
  }
}

// set data to call collection
Future<void> setCall({String email, String channelName}) async {
  callCollection
      .doc(user.uid)
      .set({
        'uid': user.uid,
        'name': user.displayName,
        'emailCaller': user.email,
        'emailCalled': email,
        'channelName': channelName,
      })
      .then((value) => null)
      .catchError((e) => print(e));
}

// delete user
void deleteUser() {
  userCollection.doc(user.uid).delete();
}

// delete all
void deleteCall() {
  callCollection.doc(user.uid).delete();
}
