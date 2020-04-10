import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:flutter/material.dart';

class NearbyScreen extends StatefulWidget {
  @override
  _NearbyScreenState createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  AmapController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('附近')),
      body: AmapView(
        zoomLevel: 10,
        onMapMoveEnd: _handleNearby,
        onMapCreated: (controller) async {
          _controller = controller;
        },
      ),
    );
  }

  Future<void> _handleNearby(MapMove move) async {}
}
