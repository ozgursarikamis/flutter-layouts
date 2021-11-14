import 'package:flutter/material.dart';

void main() {
  runApp(const HelloLayoutsApp());
}

class HelloLayoutsApp extends StatelessWidget {
  const HelloLayoutsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0xffd81b60), brightness: Brightness.dark),
          textTheme: const TextTheme(
              bodyText2: TextStyle(
            fontSize: 24,
          ))),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // centerTitle: false,
          title: const Text('Building Layouts with Flutter'),
        ),
        body: const Center(
          child: Text(
            'Hello Flutter Layouts',
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.lightbulb_outline),
          onPressed: () {
            print('You rang?');
          },
        ),
        persistentFooterButtons: <Widget>[
          IconButton(
              onPressed: () {
                print('persistent: Add Comment');
              },
              icon: const Icon(Icons.add_comment)),
          IconButton(
              onPressed: () {
                print('persistent: Add Alarm');
              },
              icon: const Icon(Icons.add_alarm)),
          IconButton(
              onPressed: () {
                print('persistent: Add Location');
              },
              icon: const Icon(Icons.add_location))
        ],
      ),
    );
  }
}
