import 'package:flutter/cupertino.dart';
import 'package:hello_layouts/utils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final Map<int, Widget> systems = const <int, Widget>{
    0: Text('Decimal'),
    1: Text('Imperial')
  };
  int unit = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: SafeArea(
          child: Column(
        children: [
          Image.network('https://bit.ly/fl_earth'),
          Util.paddingTop,
          Row(
            children: <Widget>[
              SizedBox(
                width: Util.widthOfScreen(context),
                child: CupertinoSegmentedControl(
                  children: systems,
                  onValueChanged: (int value) {
                    updateControl(value);
                  },
                  groupValue: unit,
                ),
              )
            ],
          )
        ],
      )),
    );
  }

  void updateControl(int value) {
    if (value != unit) {
      setState(() {
        unit = value;
      });
    }
  }
}
