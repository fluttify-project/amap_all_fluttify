import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'nearby.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '附近',
          children: <Widget>[
            FunctionItem(
              label: '显示附近',
              sublabel: 'NearbyScreen',
              target: NearbyScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
