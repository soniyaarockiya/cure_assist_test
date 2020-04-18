import 'package:flutter/material.dart';

import 'AuthenticationPage.dart';
import 'MyHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => AuthenticationPage(),
        'MyHomePage': (context) => MyHomePage(),

      },
//      home: MyHomePage(),
    );
  }
}
