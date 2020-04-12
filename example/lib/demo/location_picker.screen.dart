import 'package:amap_all_fluttify/amap_all_fluttify.dart';
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
      body: LocationPicker(
        requestPermission: () {
          return Permission.location.request().then((it) => it.isGranted);
        },
        poiItemBuilder: (poi, selected) {
          return ListTile(
            title: Text(poi.title),
            subtitle: Text(poi.address),
            trailing: selected ? Icon(Icons.check) : SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
