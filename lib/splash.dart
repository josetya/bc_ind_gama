import 'dart:async';
import 'package:bc_ind_gama/homepage.dart';
import 'package:flutter/material.dart';




class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomePage(title: ' Ind_BCA'),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Center(
        child: Text(
          "Ind_BCA\n\n\nASSESSMEN KANKER PAYUDARA\n di Indonesia",
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.pink,
            fontFamily: 'Satisfy',
            fontStyle: FontStyle.italic,
          ),
          textAlign: TextAlign.center,
          textScaleFactor: 1.5,
          
        ),
      ),
    );
  }
}