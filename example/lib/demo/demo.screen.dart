import 'package:demo_widgets/demo_widgets.dart';
import 'package:flutter/material.dart';

import 'district_outline.screen.dart';
import 'location_picker.screen.dart';
import 'nearby.screen.dart';
import 'show_search_result.screen.dart';

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
