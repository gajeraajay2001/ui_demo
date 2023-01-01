import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_task/app/constants/sizeConstant.dart';

class MapScreenController extends GetxController {
  Completer<GoogleMapController> controllerGoogle = Completer();
  double? lat, long;
  RxSet<Marker> markers = RxSet<Marker>({});
  RxBool hasData = false.obs;

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (!isNullEmptyOrFalse(Get.arguments)) {
        lat = Get.arguments["lat"];
        long = Get.arguments["long"];
        hasData.value = true;
      }
    });

    super.onInit();
  }

  void onMapCreated(GoogleMapController controller) {
    if (controllerGoogle.complete != null &&
        controllerGoogle.complete == false) {
      controllerGoogle.complete(controller);
    }
    markers.value.add(Marker(
        markerId: MarkerId('place_name'),
        position: LatLng(lat!, long!),
        icon: BitmapDescriptor.defaultMarker));
    markers.refresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
