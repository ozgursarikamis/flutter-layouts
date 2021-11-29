import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hero Animation',
        home: HeroPage());
  }
}

class HeroPage extends StatelessWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text(
          'Hero Page',
          style: TextStyle(color: Colors.white),
        ),
        decoration: const BoxDecoration(color: Colors.orange),
      ),
    );
  }
}
