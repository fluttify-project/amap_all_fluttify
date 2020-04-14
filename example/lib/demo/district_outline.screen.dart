import 'package:amap_all_fluttify/amap_all_fluttify.dart';
import 'package:decorated_flutter/decorated_flutter.dart';
import 'package:flutter/material.dart';

class DistrictOutlineScreen extends StatefulWidget {
  @override
  _DistrictOutlineScreenState createState() => _DistrictOutlineScreenState();
}

class _DistrictOutlineScreenState extends State<DistrictOutlineScreen> {
  AmapController _controller;
  TextEditingController _districtNameController = TextEditingController();
  List<Polygon> _currentOutline = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(title: Text('显示地区轮廓')),
      body: DecoratedColumn(
        children: <Widget>[
          Flexible(
            child: AmapView(
              zoomLevel: 4,
              onMapCreated: (controller) async {
                _controller = controller;
              },
            ),
          ),
          Flexible(
            child: DecoratedColumn(
              padding: EdgeInsets.all(kSpaceBig),
              children: <Widget>[
                TextField(controller: _districtNameController),
                RaisedButton(
                  onPressed: _handleAddDistrictOutline,
                  child: Text('显示轮廓'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _handleAddDistrictOutline() async {
    final polygonList =
        await _controller.addDistrictOutline(_districtNameController.text);
    _currentOutline.addAll(polygonList);
  }

  @override
  void dispose() {
    _districtNameController.dispose();
    super.dispose();
  }
}
