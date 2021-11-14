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
          margin: const EdgeInsets.all(100),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              color: Colors.orange,
              image: const DecorationImage(
                  image: NetworkImage("https://bitly.com/flutter_tiger")),
              gradient: RadialGradient(
                  center: const Alignment(-1.0, -1.0),
                  radius: 0.25,
                  colors: [
                    Colors.purple.shade100,
                    Colors.orange,
                    Colors.red,
                    Colors.purple.shade500
                  ]),
              shape: BoxShape.rectangle),
        ),
      ),
    );
  }
}
