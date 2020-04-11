import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:amap_all_fluttify_example/utils/next_latlng.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// 1. 限制范围
class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> with NextLatLng {
  AmapController _controller;
  List<LatLng> _dataSource;

  @override
  void initState() {
    super.initState();
    _dataSource = getNextBatchLatLng(100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('附近')),
      body: AmapView(
        zoomLevel: 13,
        onMapMoveEnd: _handleNearby,
        onMapCreated: (controller) async {
          _controller = controller;
          if ((await Permission.location.request()).isGranted) {
            _controller.showMyLocation(MyLocationOption());
          }
        },
      ),
    );
  }

  Future<void> _handleNearby(MapMove move) async {}
}
