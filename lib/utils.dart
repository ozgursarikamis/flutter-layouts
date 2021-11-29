import 'package:flutter/widgets.dart';

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
}
