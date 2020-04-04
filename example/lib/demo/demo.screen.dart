import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'show_search_result.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '地图',
          children: <Widget>[
            FunctionItem(
              label: '搜索路线规划并显示到地图',
              sublabel: 'ShowSearchResultScreen',
              target: ShowSearchResultScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
