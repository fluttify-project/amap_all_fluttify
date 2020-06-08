import 'dart:math';

import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:amap_all_fluttify_example/utils/next_latlng.dart';
import 'package:flutter/material.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> with NextLatLng {
  AmapController _controller;
  List<LatLng> _dataSource;
  List<Marker> _currentMarkerList = [];

  @override
  void initState() {
    super.initState();
    _dataSource = getNextBatchLatLng(10000, radius: 40);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('显示附近')),
      body: AmapView(
        onMapMoveEnd: _handleNearby,
        onMapCreated: (controller) async {
          _controller = controller;
        },
      ),
    );
  }

  Future<void> _handleNearby(MapMove move) async {
    await _controller.clearMarkers(_currentMarkerList);
    _currentMarkerList.clear();
    final markerOptions = _getNearData(move.latLng, move.zoom)
        .map((it) => MarkerOption(latLng: LatLng(it.latitude, it.longitude)))
        .toList();
    _currentMarkerList = await _controller.addMarkers(markerOptions.toList());
  }

  List<LatLng> _getNearData(LatLng target, double zoom) {
    bool _near(LatLng base) {
      return pow((base.latitude - target.latitude), 2) +
              pow((base.longitude - target.longitude), 2) <
          20 - zoom;
    }

    return _dataSource.where(_near).toList();
  }
}
