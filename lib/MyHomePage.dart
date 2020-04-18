import 'package:flutter/material.dart';

import 'Service/AuthServicePage.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final formKey = new GlobalKey<FormState>();
  AuthServicePage _auth = BaseAuth();

  String name;
  String age;
  String weight;
  String phoneNumber;

  //Current user sign out
  void logOutUser() async {
    //This will take us back to the authentication  screen
    Navigator.pop(context);
    await _auth.signOut();
  }

  //First validate form entries and then save the data  against the user collection in fireStore
  void checkFormAndSubmit() async {
    if (_auth.validateAndSave(formKey)) {
      await _auth.saveInDataBase(name, age, weight, phoneNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Retrieve arguments (Current user phone number from authentication screen) passed through named routes
    var phoneNumberFromAuthRoute = ModalRoute
        .of(context)
        .settings
        .arguments;
    phoneNumber = phoneNumberFromAuthRoute;
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Name",
                  ),
                  validator: (value) =>
                  value.isEmpty ? 'Please enter the name' : null,
                  onSaved: (value) => name = value,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Age",
                  ),
                  validator: (value) =>
                  value.isEmpty ? 'Please enter your age' : null,
                  onSaved: (value) => age = value,
                ),
                TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Weight",
                  ),
                  validator: (value) =>
                  value.isEmpty ? 'Please enter your weight' : null,
                  onSaved: (value) => weight = value,
                ),
                RaisedButton(
                  onPressed: checkFormAndSubmit,
                  child: Text('Submit'),
                ),
                RaisedButton(
                  //Verify phoneNumber
                  onPressed: logOutUser,
                  child: Text('SignOut'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
