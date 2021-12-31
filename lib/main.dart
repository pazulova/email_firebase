


import 'package:email_firebase/screens/auth.dart';
import 'package:email_firebase/screens/home.dart';
import 'package:flutter/material.dart';

import 'domiain/workout.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Max Fitness',
      theme: ThemeData(
     primaryColor: Color.fromRGBO(50, 65, 85, 1),
     // ignore: prefer_const_constructors
     textTheme: TextTheme(subtitle1: TextStyle(color: Colors.brown),),
      ),
      home: AuthorizationPage(),
    );
  }
}



