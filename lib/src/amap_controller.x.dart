import 'package:flutter/material.dart';

import '../amap_all_fluttify.dart';
import 'models.dart';

extension AmapControllerX on AmapController {
  Future<void> addDriveRoute(
    DriveRouteResult driveRouteResult, {
    TrafficOption trafficOption,
    double lineWidth,
    Uri customTexture,
    ImageConfiguration imageConfig,
  }) async {
    assert(driveRouteResult != null);
    for (final path in await driveRouteResult.drivePathList) {
      for (final step in await path.driveStepList) {
        if (trafficOption != null && trafficOption.show) {
          for (final tmc in await step.tmsList) {
            final status = await tmc.status;
            Color statusColor = Colors.green;
            switch (status) {
              case '缓行':
                statusColor = Colors.yellow;
                break;
              case '拥堵':
                statusColor = Colors.red;
                break;
              case '未知':
                statusColor = Colors.blue;
                break;
              default:
                break;
            }
            await addPolyline(PolylineOption(
              latLngList: await tmc.polyline,
              strokeColor: statusColor,
              width: lineWidth,
              customTexture: customTexture,
              imageConfig: imageConfig,
            ));
          }
        } else {
          await addPolyline(PolylineOption(
            latLngList: await step.polyline,
            width: lineWidth,
            customTexture: customTexture,
            imageConfig: imageConfig,
          ));
        }
      }
    }
  }
}
