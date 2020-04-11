import 'dart:async';

import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPickerScreen extends StatefulWidget {
  @override
  _LocationPickerScreenState createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('位置选择')),
      body: LocationPicker(),
    );
  }
}

class LocationPicker extends StatefulWidget {
  @override
  _LocationPickerState createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  AmapController _controller;
  final _poiStream = StreamController<List<Poi>>();

  @override
  Widget build(BuildContext context) {
    return DecoratedColumn(
      children: <Widget>[
        Flexible(
          child: AmapView(
            zoomLevel: 16,
            onMapMoveEnd: (move) async {
              _search(move.latLng);
            },
            onMapCreated: (controller) async {
              _controller = controller;
              if ((await Permission.location.request()).isGranted) {
                await _controller.showMyLocation(MyLocationOption(
                  strokeColor: Colors.transparent,
                  fillColor: Colors.transparent,
                ));
                _search(await _controller.getLocation());
              }
            },
          ),
        ),
        Flexible(
          child: StreamBuilder<List<Poi>>(
            stream: _poiStream.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Text(data[index].title);
                  },
                );
              } else {
                return Center();
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _poiStream?.close();
    super.dispose();
  }

  Future<void> _search(LatLng location) async {
    AmapSearch.searchAround(location).then(_poiStream.add);
  }
}
