import 'package:flutter/material.dart';
import 'package:flutter_api_new/home_page.dart';
import 'package:flutter_api_new/home_page1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get Data'),
        ),
        body: const HomePage1(),
      ),
    );
  }
}
