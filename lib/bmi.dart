import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_layouts/utils.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  int unit = 0;

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
                    Expanded(
                        child:
                            CupertinoTextField(controller: heightController)),
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
                    Expanded(
                        child: CupertinoTextField(
                      controller: weightController,
                    )),
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

  void showResult() async {
    double height;
    double weight;

    int unit = await Util.getSettings();

    height = double.tryParse(heightController.text) ?? 0;
    weight = double.tryParse(weightController.text) ?? 0;

    double result = Util.calculateBMI(height, weight, unit);

    String message = 'Your BMI is ' + result.toString();
    CupertinoAlertDialog dialog = CupertinoAlertDialog(
      title: const Text('Result'),
      content: Text(message),
      actions: [
        CupertinoDialogAction(
          child: const Text('OK'),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  void calculateBmi() {
    showResult();
  }
}
