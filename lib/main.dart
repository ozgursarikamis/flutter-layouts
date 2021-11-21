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
      child: ListView.separated(
        itemCount: 25,
        itemBuilder: (context, index) => createSquare(index),
        separatorBuilder: (context, index) => createSeparator(index),
        scrollDirection: Axis.vertical,
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
      Container square = Container(
        color: colors[i % 5],
        // width: 60.0 * (numSquares - i),
        height: 100.0,
        child: Text(i.toString()),
      );
      i++;

      squares.add(square);
    }

    return squares;
  }

  Widget createSeparator(int position) {
    Widget separator = Container(
      height: 15,
      color: Colors.black26,
    );

    return separator;
  }

  Widget createSquare(int position) {
    List colors = [
      Colors.amber,
      Colors.deepPurple,
      Colors.deepOrange,
      Colors.indigo,
      Colors.lightBlue
    ];

    Container square = Container(
      color: colors[position % 5],
      height: 100.0,
      child: Text(position.toString()),
    );

    return square;
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

    Positioned buttonOrder = Positioned(
        bottom: sizeY / 20,
        left: sizeX / 20,
        width: sizeX - sizeX / 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.orange,
              elevation: 12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2))),
          onPressed: () {},
          child: const Text(
            'Order Now!',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ));

    layoutChildren.add(buttonOrder);
    return layoutChildren;
  }
}
