import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/map_screen_controller.dart';

class MapScreenView extends GetWidget<MapScreenController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: (controller.hasData.isTrue)
            ? GoogleMap(
                markers: controller.markers.value,
                onMapCreated: controller.onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(controller.lat!, controller.long!),
                  zoom: 11.0,
                ),
                myLocationButtonEnabled: false,
                compassEnabled: true,
                buildingsEnabled: true,
                scrollGesturesEnabled: true,
              )
            : Center(child: CircularProgressIndicator()),
      );
    });
  }
}
