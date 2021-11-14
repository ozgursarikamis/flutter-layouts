import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your app name',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Your Title here'),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          width: 200,
          height: 200,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30)),
              color: Colors.orange,
              shape: BoxShape.rectangle),
        ),
      ),
    );
  }
}
