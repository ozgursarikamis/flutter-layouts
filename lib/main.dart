import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_layouts/bmi.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'CupertinoApp',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: const [
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person), label: 'BMI'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings_solid), label: 'Settings')
      ]),
      tabBuilder: (BuildContext context, int i) {
        return const Bmi();
      },
    );
  }
}
