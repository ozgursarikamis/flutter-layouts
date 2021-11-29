import 'package:flutter/cupertino.dart';

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
        child: Column(
          children: <Widget>[
            Image.network('https://bit.ly/img_bmi'),
            Row(
              children: const <Widget>[
                Text('Height'),
                Expanded(child: CupertinoTextField())
              ],
            ),
            Row(
              children: const <Widget>[
                Text('Weight'),
                Expanded(child: CupertinoTextField())
              ],
            ),
            CupertinoButton.filled(
                child: const Text('Calculate BMI'), onPressed: calculateBmi)
          ],
        ),
      ),
    );
  }

  void calculateBmi() {}
}
