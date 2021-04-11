
import 'dart:ui';

import 'package:flutter/material.dart';



class Resikorendah extends StatelessWidget {
  const Resikorendah({
    Key key,
    @required this.totalnilai, this.totalumur,
  }) : super(key: key);

  final double totalnilai;
  final double totalumur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            Center(
              child: Text(
                "Resiko Rendah \nScore assessment = $totalnilai",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Text(
                "lakukan cek kesehatan secara rutin, olah raga teratur, makan makanan rendah kalori, rendah lemah.",
                style: TextStyle(fontSize: 20, color:Colors.black),
                ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
          ],
        ),
      ),
    );
  }
}

class Resikosedang extends StatelessWidget {
  const Resikosedang({
    Key key,
    @required this.totalnilai, this.totalumur,
  }) : super(key: key);

  final double totalnilai;
  final double totalumur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Center(
                child: Text(
                  'Resiko Sedang \nScore assessment = $totalnilai',
                  style: TextStyle(fontSize: 20, color:Colors.black), 
                ),
              ),
              Text(
                "lakukan cek kesehatan secara rutin, olah raga teratur, makan makanan rendah kalori, rendah lemah.",
                style: TextStyle(fontSize: 20, color:Colors.black),
                ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ]),
      ),
    );
  }
}

class Resikotinggi extends StatelessWidget {
  const Resikotinggi({
    Key key,
    @required this.totalnilai, this.totalumur,
  }) : super(key: key);

  final double totalnilai;
  final double totalumur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: [
              Center(
                child: Text(
                  'Resiko Tinggi \nScore assessment = $totalnilai',
                  style: TextStyle(fontSize: 20, color:Colors.black),
                ),
              ),
              Text('segera cek kesehatan ke dokter terdekat, sangat direkomendasikan untuk wanita Asia mulai umur 40 tahun sudah rutin untuk melakukan mammography atau skrining kanker.'),

              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Go back!'),
              ),
            ]),
      ),
    );
  }
}
