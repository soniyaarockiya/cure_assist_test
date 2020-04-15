import 'package:flutter/material.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  final formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String email;
  String password;

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
                hintText: "Email",
              ),
              validator: (value) =>
              value.isEmpty ? 'Email cant be empty' : null,
              onSaved: (value) => email = value,
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
              ),
              validator: (value) =>
              value.isEmpty ? 'Password cant be empty' : null,
              onSaved: (value) => password = value,
            ),
            RaisedButton(
              onPressed: () {},
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
