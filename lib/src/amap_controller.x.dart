import 'package:flutter/material.dart';

import '../amap_all_fluttify.dart';

extension AmapControllerX on AmapController {
  /// 添加地区轮廓
  ///
  /// 地区名称[districtName], 轮廓宽度[width], 轮廓颜色[strokeColor], 填充颜色[fillColor]
  /// 由于一个省份可能包含多个区域, 比如浙江包含很多岛屿, 如果把岛屿也画进去, 那么会非常消耗性能.
  /// 业务上而言, 我认为这些岛屿是否画进去基本上不影响使用, 所以增加了[onlyMainDistrict]参数
  /// 来控制是否只显示主要部分的边界, 如果你对地区完整度的需求非常高, 那么就把[onlyMainDistrict]
  /// 设置为true, 随之而来像浙江这种地区的边界绘制起来就会非常慢.
  /// 我的测试结果是MIX 3, release模式下需要5-6秒才能绘制完成.
  Future<List<Polygon>> addDistrictOutline(
    String districtName, {
    double width = 5,
    Color strokeColor = Colors.green,
    Color fillColor = Colors.transparent,
    bool onlyMainDistrict = true,
  }) async {
    assert(districtName != null && districtName.isNotEmpty);
    final district =
        await AmapSearch.searchDistrict(districtName, showBoundary: true);

    final districtList = await district.districtList;
    if (districtList.isNotEmpty) {
      if (onlyMainDistrict) {
        List<LatLng> boundary = await district.districtList
            .then((it) => it[0].boundary)
            .then((it) => it
                .reduce((pre, next) => pre.length > next.length ? pre : next));
        return [
          await addPolygon(PolygonOption(
            latLngList: boundary,
            width: width,
            strokeColor: strokeColor,
            fillColor: fillColor,
          ))
        ];
      } else {
        List<List<LatLng>> boundaryList =
            await (await district.districtList)[0].boundary;
        return [
          for (final boundary in boundaryList)
            await addPolygon(PolygonOption(
              latLngList: boundary,
              width: width,
              strokeColor: strokeColor,
              fillColor: fillColor,
            ))
        ];
      }
    } else {
      return null;
    }
  }

  /// 添加地区轮廓
  ///
  /// 地区轮廓经纬度列表[boundary], 轮廓宽度[width], 轮廓颜色[strokeColor], 填充颜色[fillColor]
  Future<Polygon> addDistrictOutlineWithData(
    List<LatLng> boundary, {
    double width = 5,
    Color strokeColor = Colors.green,
    Color fillColor = Colors.transparent,
  }) async {
    assert(boundary != null && boundary.isNotEmpty);
    return addPolygon(PolygonOption(
      latLngList: boundary,
      width: width,
      strokeColor: strokeColor,
      fillColor: fillColor,
    ));
  }

  // TODO 批量地区绘制
}
