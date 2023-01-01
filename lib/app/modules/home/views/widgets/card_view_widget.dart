import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_task/app/constants/sizeConstant.dart';
import 'package:ui_task/app/modules/home/controllers/home_controller.dart';
import 'package:ui_task/app/modules/home/views/widgets/basic_info_widget.dart';
import 'package:ui_task/app/modules/home/views/widgets/gallery_carousel_widget.dart';
import 'package:ui_task/app/modules/home/views/widgets/key_feture_widget.dart';
import 'package:ui_task/app/modules/home/views/widgets/main_image_view_widget.dart';
import 'package:ui_task/app/theme/theme_helper.dart';

import '../../../../model/data_response_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../utilities/utilities.dart';

class CardViewWidget extends StatefulWidget {
  HomeController controller = HomeController();
  Properties properties = Properties();
  CardViewWidget({required this.controller, required this.properties});

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  Completer<GoogleMapController> controllerGoogle = Completer();
  double? lat, long;
  RxSet<Marker> markers = RxSet<Marker>({});
  RxBool hasData = false.obs;
  void onMapCreated(GoogleMapController controller) {
    if (controllerGoogle.complete != null &&
        controllerGoogle.complete == false) {
      controllerGoogle.complete(controller);
    }
    markers.value.add(Marker(
        markerId: MarkerId('place_name'),
        position: LatLng(lat!, long!),
        icon: BitmapDescriptor.defaultMarker));
    setState(() {});
  }

  @override
  void initState() {
    lat = widget.properties.latitude!;
    long = widget.properties.longitude!;
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MySize.getHeight(20),
              ),
              color: Colors.white,
            ),
            margin: EdgeInsets.symmetric(
                horizontal: MySize.getWidth(10),
                vertical: MySize.getHeight(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                MySize.getHeight(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MainImageViewWidget(properties: widget.properties),
                    Spacing.height(10),
                    Container(
                      padding: EdgeInsets.only(left: MySize.getWidth(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: appTheme.getTitleTextStyle,
                          ),
                          Spacing.height(10),
                          Text(
                            widget.properties.description.toString(),
                            style: appTheme.getNormalGreyTextStyle,
                          ),
                          Spacing.height(20),
                          Text(
                            "Location",
                            style: appTheme.getTitleTextStyle,
                          ),
                          Spacing.height(10),
                          Text(
                            widget.properties.nearestLocation.toString(),
                            style: appTheme.getNormalGreyTextStyle,
                          ),
                          Spacing.height(10),
                          if (!isNullEmptyOrFalse(widget.properties.latitude) &&
                              !isNullEmptyOrFalse(widget.properties.longitude))
                            Padding(
                              padding:
                                  EdgeInsets.only(right: MySize.getWidth(10)),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(MySize.getHeight(15)),
                                child: Container(
                                  height: MySize.getHeight(170),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          MySize.getHeight(15))),
                                  child: (controller.hasData.isTrue)
                                      ? GoogleMap(
                                          markers: markers,
                                          onMapCreated: onMapCreated,
                                          initialCameraPosition: CameraPosition(
                                            target: LatLng(lat!, long!),
                                            zoom: 12.0,
                                          ),
                                          onTap: (value) {
                                            Get.toNamed(Routes.MAP_SCREEN,
                                                arguments: {
                                                  "lat": widget
                                                      .properties.latitude!,
                                                  "long": widget
                                                      .properties.longitude!,
                                                });
                                          },
                                          gestureRecognizers: Set()
                                            ..add(Factory<PanGestureRecognizer>(
                                                () => PanGestureRecognizer())),
                                          myLocationButtonEnabled: false,
                                          compassEnabled: true,
                                          buildingsEnabled: true,
                                          scrollGesturesEnabled: true,
                                        )
                                      : Center(
                                          child: CircularProgressIndicator()),
                                ),
                              ),
                            ),
                          Spacing.height(20),
                          if (!isNullEmptyOrFalse(
                              widget.properties.keyFeatures))
                            KeyAndFeatureWidget(
                                keyFeatureList: widget.properties.keyFeatures!),
                          Spacing.height(20),
                          if (!isNullEmptyOrFalse(
                              widget.properties.propertyImages))
                            GalleryCarouselWidget(
                                propertyImages:
                                    widget.properties.propertyImages!),
                          Spacing.height(20),
                          BasicInfoWidget(properties: widget.properties),
                          Spacing.height(10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
