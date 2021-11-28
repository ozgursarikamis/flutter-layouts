import 'package:flutter/material.dart';
import 'package:hello_layouts/art_route.dart';
import 'package:hello_layouts/art_util.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NavApp',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: ArtRoute(
        art: ArtUtil.img_vangogh,
      ),
    );
  }
}
