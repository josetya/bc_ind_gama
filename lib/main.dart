import 'package:bc_ind_gama/splash.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ' “Ind_BCA” (INDONESIAN BREAST CANCER ASSESSMENT)',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splashscreen(),
    );
  }
  
}
