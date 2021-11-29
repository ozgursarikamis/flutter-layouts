import 'package:flutter/cupertino.dart';
import 'package:hello_layouts/utils.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int unit = 1;
  @override
  Widget build(BuildContext context) {
    final Map<int, Widget> systems = <int, Widget>{
      0: const Text('Decimal'),
      1: const Text('Imperial')
    };

    Util.getSettings().then(updateControl);

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
                    Util.saveSettings(value);
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
