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
        children: showPizzaLayout(sizeX, sizeY),
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
      Positioned square = Positioned(
          top: 100 + i.toDouble() * 100,
          left: 25 + i.toDouble() * 25,
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

  List<Widget> showPizzaLayout(double sizeX, double sizeY) {
    List<Widget> layoutChildren = [];

    Container background = Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('http://bit.ly/pizza_image'),
              fit: BoxFit.fitHeight)),
    );
    layoutChildren.add(background);

    Positioned pizzaCard = Positioned(
        top: sizeX / 20,
        left: sizeX / 20,
        child: Card(
          elevation: 12,
          color: Colors.white70,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              Text('Pizza Margherita',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[800])),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'This delicious pizza is made of Tomato,\n Mozarella and Basil.\n\nSeriously, you can\'t miss it.',
                  style: TextStyle(fontSize: 18, color: Colors.grey[800]),
                ),
              )
            ],
          ),
        ));

    layoutChildren.add(pizzaCard);

    return layoutChildren;
  }
}
