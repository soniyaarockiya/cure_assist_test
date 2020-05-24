import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthServicePage {
  bool validateAndSave(formKey);

  Future<void> saveInDataBase(String name, String age, String weight,
      String phoneNumber);

  Future<void> verifyPhone(String phoneNumber, BuildContext context);

  Future<void> signOut();
}

class BaseAuth implements AuthServicePage {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser _user;

  bool validateAndSave(formKey) {
    final form = formKey.currentState;
    if (form.validate()) {
      //if you don't save the form , it returns null for both email and password
      form.save();
      return true;
    } else {
      return false;
    }
  }

  Future<void> verifyPhone(String phoneNumber, BuildContext context) async {
    await _firebaseAuth.verifyPhoneNumber(
      //pass phone number entered by user
        phoneNumber: phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          //Call for firebase signIn with credentials method
          AuthResult _result =
          await _firebaseAuth.signInWithCredential(credential);

          //Get current user data , to create db under that user
          _user = _result.user;
          //Just a test statement
          print("User value is .......${_user.phoneNumber}");

          if (_user != null) {
            print(
                " User Phone number verified.....................................");
            Navigator.of(context).pushNamed("MyHomePage",
                arguments: _user.phoneNumber.toString());
          } else {
            print("..user value null...................");
          }
        },
        verificationFailed: (AuthException exception) {
          print(
              "Verififcation failed...exception is ......${exception.message}");
        },
        codeSent: null,
        codeAutoRetrievalTimeout: null);
  }

  //Add user data to the relevant user collection in fireStore
  Future<void> saveInDataBase(String name, String age, String weight,
      String phoneNumber) async {
    try {
      String currentTime = Timestamp.now().toString();
      await Firestore.instance
          .collection("User Collection")
          .document(phoneNumber.toString())
          .collection(currentTime.toString())
          .add({'name': name, 'age': age, 'weight': weight});
//          .setData({'name': name, 'age': age, 'weight': weight});

      print(
          "Data uploaded successfully...........................................");
    } catch (e) {
      print(
          "Something wrong while trying to save data in db ......................" +
              e.toString());
    }
  }

  //Firebase sign out
  @override
  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
