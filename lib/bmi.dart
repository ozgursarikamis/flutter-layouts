import 'package:flutter/cupertino.dart';
import 'package:hello_layouts/utils.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('BMI')),
      child: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: Util.heightOfScreen(context) * .8),
            child: Column(
              children: <Widget>[
                Image.network('https://bit.ly/img_bmi'),
                Util.paddingTop,
                Row(
                  children: <Widget>[
                    Util.paddingLeft,
                    SizedBox(
                      child: const Text('Height'),
                      width: Util.widthOfScreen(context) / 3,
                    ),
                    const Expanded(child: CupertinoTextField()),
                    Util.paddingLeft
                  ],
                ),
                Util.paddingTop,
                Row(
                  children: <Widget>[
                    Util.paddingLeft,
                    SizedBox(
                      child: const Text('Weight'),
                      width: Util.widthOfScreen(context) / 3,
                    ),
                    const Expanded(child: CupertinoTextField()),
                    Util.paddingLeft
                  ],
                ),
                const Expanded(child: Util.paddingTop),
                CupertinoButton.filled(
                    child: const Text('Calculate BMI'),
                    onPressed: calculateBmi),
                Util.paddingTop
              ],
            ),
          ),
        ),
      ),
    );
  }

  void calculateBmi() {}
}
