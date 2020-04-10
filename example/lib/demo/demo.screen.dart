import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'basic/show_search_result.screen.dart';

class MapDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        FunctionGroup(
          headLabel: '基础',
          children: <Widget>[
            FunctionItem(
              label: '显示路线规划结果',
              sublabel: 'ShowSearchResultScreen',
              target: ShowSearchResultScreen(),
            ),
          ],
        ),
        FunctionGroup(
          headLabel: '高阶',
          children: <Widget>[
            FunctionItem(
              label: '附近',
              sublabel: 'ShowSearchResultScreen',
              target: ShowSearchResultScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
