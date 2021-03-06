import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hello_layouts/radial.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util {
  static const Padding paddingTop = Padding(padding: EdgeInsets.only(top: 36));
  static const Padding paddingLeft =
      Padding(padding: EdgeInsets.only(left: 12));
  static const TextStyle textStyle = TextStyle(fontSize: 24);

  static double widthOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double heightOfScreen(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double calculateBMI(double height, double weight, int unit) {
    double result;
    if (unit == 0) {
      result = (weight / height / height) * 10000;
    } else {
      result = (weight / height / height) * 703;
    }
    return result;
  }

  static void saveSettings(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('unit', value);
  }

  static Future<int> getSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int result = prefs.getInt('unit') ?? 0;
    return result;
  }

  static const String coffeeUrl = 'https://bit.ly/fl_coffee';
  static const String cappucinoUrl =
      'https://www.detaygida.com.tr/Content/Images/kahve.png';
  static const String teaUrl =
      'https://www.thespruceeats.com/thmb/q-mTJ8ei_cRAhvG2BRGtnqIIby4=/3865x2174/smart/filters:no_upscale()/assorted-coffee-drinks-in-cups-on-coffee-beans-background-682103254-5abd8e8a3128340037f89265.jpg';

  static Widget buildHeroIcon(String path, String tag) {
    return Hero(
        tag: tag,
        child: SizedBox(
          width: 80,
          height: 80,
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
        ));
  }

  static Widget buildHeroDestination(String path, tag, double width) {
    return Hero(
        tag: tag,
        child: SizedBox(
          width: width,
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
        ));
  }

  static Widget buildHeroRadialIcon(
      String path, String tag, double minRadius, double maxRadius) {
    return Hero(
      tag: tag,
      createRectTween: createTween,
      child: SizedBox(
        height: minRadius,
        width: minRadius,
        child: RadialTransition(
          maxRadius: maxRadius,
          child: Image.network(
            path,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  static Widget buildHeroRadialDestination(String path, String tag,
      double maxWidth, double maxHeight, VoidCallback pop) {
    return GestureDetector(
        child: Hero(
          createRectTween: createTween,
          tag: tag,
          child: SizedBox(
            height: maxHeight,
            width: maxWidth,
            child: RadialTransition(
              maxRadius: maxWidth / 2,
              child: Image.network(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        onTap: pop);
  }

  static Tween<Rect?> createTween(Rect? begin, Rect? end) {
    return MaterialRectArcTween(begin: begin, end: end);
  }
}
