import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'location_picker.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '选择位置',
          children: <Widget>[
            FunctionItem(
              label: '选择位置',
              sublabel: 'LocationPickerScreen',
              target: LocationPickerScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
