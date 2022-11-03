import 'package:flutter/material.dart';
import 'package:test/screens/home_page.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
