import 'package:flutter/material.dart';
import 'Detail_Page.dart';
import 'Home_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const HomePage(),
        'Detail_Page': (context) => const Detail_Page(),
      },
    ),
  );
}