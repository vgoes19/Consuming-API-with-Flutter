import 'package:flutter/material.dart';
import 'package:flutter_api/pages/home_page.dart';

void main() {
  runApp(const MyApp());
  //findCharactersPage(1);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false
    );
  }
}