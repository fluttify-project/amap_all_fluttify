import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'district_outline.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '地区轮廓',
          children: <Widget>[
            FunctionItem(
              label: '显示地区轮廓',
              sublabel: 'DistrictOutlineScreen',
              target: DistrictOutlineScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
