import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gridview',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Gridview'),
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
        child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
          padding: const EdgeInsets.all(5),
          children: createGallery(50),
        ));
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

  List<Contact> buildContacts() {
    List<Contact> contacts = [];
    contacts
        .add(Contact('Thomas Anderson', 'The Matrix', Icons.sentiment_neutral));
    contacts.add(
        Contact('Frank Slade', 'Scent of a Woman', Icons.sentiment_satisfied));
    contacts.add(Contact(
        'Mildred Hayes',
        'Three Billboards Outside Ebbing, Missouri',
        Icons.sentiment_dissatisfied));
    contacts
        .add(Contact('Bruce Wayne', 'The Dark Night', Icons.sentiment_neutral));
    contacts.add(
        Contact('Jamal Malik', 'The Millionaire', Icons.sentiment_satisfied));

    return contacts;
  }

  List<ListTile> showContacts() {
    List<Contact> contacts = buildContacts();
    for (var i = 0; i < 20; i++) {
      contacts.addAll(buildContacts());
    }

    List<ListTile> tileList = [];
    for (var element in contacts) {
      tileList.add(ListTile(
        title: Text(element.name),
        subtitle: Text(element.subTitle),
        leading: CircleAvatar(
          child: Icon(element.icon),
          backgroundColor: Colors.amber,
          foregroundColor: Colors.white,
        ),
        trailing: const Icon(Icons.arrow_right),
        onTap: () => true,
      ));
    }

    return tileList;
  }

  List<Widget> createGallery(int numImages) {
    List<Widget> images = [];
    List<String> urls = [];
    urls.add('http://bit.ly/gv_car_1');
    urls.add('http://bit.ly/gv_car_2');
    urls.add('http://bit.ly/gv_car_3');
    urls.add('http://bit.ly/gv_car_4');
    urls.add('http://bit.ly/gv_car_5');

    Widget image;
    int i = 0;

    while (i < numImages) {
      image = Image.network(urls[i % 5]);
      images.add(image);
      i++;
    }

    return images;
  }
}

class Contact {
  String name;
  String subTitle;
  IconData icon;
  Contact(this.name, this.subTitle, this.icon);
}
