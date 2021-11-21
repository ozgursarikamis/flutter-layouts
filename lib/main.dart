import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stack',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Stack'),
        ),
        backgroundColor: Colors.indigo[100],
        body: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width; // available screen width
    final sizeY = MediaQuery.of(context).size.height; // available screen height

    return SizedBox(
      width: sizeX,
      height: sizeY,
      child: Stack(
        children: createSquares(5),
      ),
    );
  }

  List<Widget> createSquares(int numSquares) {
    int i = 0;
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    List<Widget> squares = [];
    squares.add(Container(color: Colors.black));

    while (i < numSquares) {
      Align square = Align(
          alignment: Alignment.center,
          child: Container(
            color: colors[i],
            width: 60.0 * (numSquares - i),
            height: 60.0 * (numSquares - i),
            child: Text(i.toString()),
          ));
      i++;

      squares.add(square);
    }

    return squares;
  }
}
