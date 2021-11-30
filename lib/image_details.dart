import 'package:flutter/material.dart';
import 'package:hello_layouts/utils.dart';
// import 'package:flutter/scheduler.dart' show timeDilation;

class ImageDetails extends StatelessWidget {
  final String drinkPath;
  final String drinkTag;

  const ImageDetails(this.drinkPath, this.drinkTag);

  @override
  Widget build(BuildContext context) {
    // timeDilation = 10; // Normal speed is 1
    double width = Util.widthOfScreen(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
        child: Util.buildHeroDestination(drinkPath, drinkTag, width),
      ),
    );
  }
}
