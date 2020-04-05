import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'show_search_result.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '搜索',
          children: <Widget>[
            FunctionItem(
              label: '显示路线规划结果',
              sublabel: 'ShowSearchResultScreen',
              target: ShowSearchResultScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
