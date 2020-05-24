import 'package:flutter/material.dart';
import 'AuthenticationPage.dart';
import 'MyHomePage.dart';
import 'CovidDataPage.dart';

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

      initialRoute: 'CovidDataPage',
      routes: {
        '/': (context) => AuthenticationPage(),
        'MyHomePage': (context) => MyHomePage(),
        'CovidDataPage': (context) => CovidPage(),
      },
//      home: MyHomePage(),
    );
  }
}
