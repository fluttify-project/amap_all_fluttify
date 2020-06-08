import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PoiInfo {
  PoiInfo(this.poi);

  final Poi poi;
  bool selected = false;

  @override
  String toString() {
    return 'PoiInfo{poi: $poi, selected: $selected}';
  }
}

@immutable
class TrafficOption {
  /// 是否显示
  final bool show;

  /// 通畅路段颜色
  final Color goodColor;

  /// 缓行路段颜色
  final Color badColor;

  /// 拥堵路段颜色
  final Color terribleColor;

  /// 未知路段颜色
  final Color unknownColor;

  TrafficOption({
    @required this.show,
    this.goodColor = Colors.green,
    this.badColor = Colors.yellow,
    this.terribleColor = Colors.red,
    this.unknownColor = Colors.blue,
  }) : assert(show != null);

  @override
  String toString() {
    return 'TrafficOption{show: $show, goodColor: $goodColor, badColor: $badColor, terribleColor: $terribleColor, unknownColor: $unknownColor}';
  }
}
