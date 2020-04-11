import 'package:flutter/material.dart';

import '../amap_all_fluttify.dart';

extension AmapControllerX on AmapController {
  /// 添加地区轮廓
  ///
  /// 地区名称[districtName], 轮廓宽度[width], 轮廓颜色[strokeColor], 填充颜色[fillColor]
  Future<Polygon> addDistrictOutline(
    String districtName, {
    double width = 5,
    Color strokeColor = Colors.green,
    Color fillColor = Colors.transparent,
  }) async {
    assert(districtName != null && districtName.isNotEmpty);
    final district =
        await AmapSearch.searchDistrict(districtName, showBoundary: true);

    final districtList = await district.districtList;
    if (districtList.isNotEmpty) {
      List<LatLng> boundary = await (await district.districtList)[0].boundary;
      return addPolygon(PolygonOption(
        latLngList: boundary,
        width: width,
        strokeColor: strokeColor,
        fillColor: fillColor,
      ));
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
