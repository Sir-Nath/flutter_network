import 'package:flutter/material.dart';
import 'package:flutter_network/views/home_screen.dart';
import 'package:flutter_network/views/http/http_screen.dart';

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
      home:const HomeScreen()
    );
  }
}
