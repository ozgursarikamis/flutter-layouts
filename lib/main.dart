import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_layouts/image_details.dart';
import 'package:hello_layouts/utils.dart';

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
    final double maxRadius = Util.widthOfScreen(context);
    const double minRadius = 80;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation Title'),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        alignment: Alignment.topLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  changeRoute(context, 'coffee');
                },
                child: Util.buildHeroRadialIcon(
                    Util.coffeeUrl, 'coffee', minRadius, maxRadius)),
            GestureDetector(
                onTap: () {
                  changeRoute(context, 'cappuccino');
                },
                child: Util.buildHeroRadialIcon(
                    Util.cappucinoUrl, 'cappuccino', minRadius, maxRadius)),
            GestureDetector(
              child: Util.buildHeroRadialIcon(
                  Util.teaUrl, 'tea', minRadius, maxRadius),
              onTap: () {
                changeRoute(context, 'tea');
              },
            ),
          ],
        ),
      ),
    );
  }

  void changeRoute(BuildContext context, String drink) {
    switch (drink) {
      case 'coffee':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetails(Util.coffeeUrl, drink)));
        break;
      case 'tea':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetails(Util.teaUrl, drink)));
        break;
      case 'cappuccino':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ImageDetails(Util.coffeeUrl, drink)));
        break;
      default:
    }
  }
}
