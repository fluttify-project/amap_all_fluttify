import 'dart:math';

import 'package:amap_core_fluttify/amap_core_fluttify.dart';

mixin NextLatLng {
  // 需要减去0.5 以生成一半正数一半负数
  final random = Random();

  LatLng getNextLatLng({
    double centerLatitude = 39.90960,
    double centerLongitude = 116.397228,
    int radius = 1,
  }) {
    return LatLng(
      centerLatitude + (random.nextDouble() - 0.5) * radius,
      centerLongitude + (random.nextDouble() - 0.5) * radius,
    );
  }

  List<LatLng> getNextBatchLatLng(
    int count, {
    double centerLatitude = 39.90960,
    double centerLongitude = 116.397228,
    int radius = 1,
  }) {
    return [
      for (int i = 0; i < count; i++)
        LatLng(
          centerLatitude + (random.nextDouble() - 0.5) * radius,
          centerLongitude + (random.nextDouble() - 0.5) * radius,
        )
    ];
  }
}
