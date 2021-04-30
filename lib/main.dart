import 'package:flutter/material.dart';
import 'AlisverisListesi/Alisveris_Listesi_Sayfasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: AlisverisListesiSayfasi(),
    );
  }
}
