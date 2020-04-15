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
    final provinceList = [
      '河北省',
      '山西省',
      '辽宁省',
      '吉林省',
      '黑龙江省',
      '江苏省',
      '浙江省',
      '安徽省',
      '福建省',
      '江西省',
      '山东省',
      '河南省',
      '湖北省',
      '湖南省',
      '广东省',
      '海南省',
      '四川省',
      '贵州省',
      '云南省',
      '陕西省',
      '甘肃省',
      '青海省',
      '台湾省',
    ];
    for (final province in provinceList) {
      await _controller.addDistrictOutline(province);
    }
  }

  @override
  void dispose() {
    _districtNameController.dispose();
    super.dispose();
  }
}
