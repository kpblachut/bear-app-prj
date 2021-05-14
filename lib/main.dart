import 'package:bear_prj/pages/home.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:  Colors.orange[800],
        accentColor: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.grey[800],

        fontFamily: "Roboto",
        
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.white, fontSize: 15.0),
        )
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Home(),
    );
  }
}