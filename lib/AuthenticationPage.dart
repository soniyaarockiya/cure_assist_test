import 'package:flutter/material.dart';

import 'Service/AuthServicePage.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final formKey = new GlobalKey<FormState>();
  AuthServicePage _auth = BaseAuth();
  String phoneNumber;
  bool finalResult = false;

  // This will first validate the form, and then authenticate the user phone number
  Future<void> logInUser() async {
    if (_auth.validateAndSave(formKey)) {
      await _auth.verifyPhone(phoneNumber, context);
      //Clear form
      formKey.currentState.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                hintText: "Enter Phone number",
              ),
              validator: (value) =>
              value.isEmpty ? 'Mobile number cant be empty' : null,
              onSaved: (value) => phoneNumber = value,
            ),
            RaisedButton(
              //Verify phoneNumber
              onPressed: logInUser,
              child: Text('SignIn'),
            )
          ],
        ),
      ),
    );
  }
}
