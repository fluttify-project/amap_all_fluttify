import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'advance/nearby.screen.dart';
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
        SPACE_BIG_VERTICAL,
        FunctionGroup(
          headLabel: '高阶',
          children: <Widget>[
            FunctionItem(
              label: '附近',
              sublabel: 'NearbyScreen',
              target: NearbyScreen(),
            ),
          ],
        ),
      ],
    );
  }
}
