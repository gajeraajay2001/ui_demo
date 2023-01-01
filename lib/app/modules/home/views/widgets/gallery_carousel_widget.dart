import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:ui_task/app/model/data_response_model.dart';
import 'package:ui_task/app/modules/home/controllers/home_controller.dart';

import '../../../../constants/sizeConstant.dart';
import '../../../../theme/theme_helper.dart';

class GalleryCarouselWidget extends StatefulWidget {
  List<PropertyImages> propertyImages = [];

  GalleryCarouselWidget({required this.propertyImages});

  @override
  State<GalleryCarouselWidget> createState() => _GalleryCarouselWidgetState();
}

class _GalleryCarouselWidgetState extends State<GalleryCarouselWidget> {
  int currentIndexOfCard = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Gallery",
            style: appTheme.getTitleTextStyle,
          ),
          Spacing.height(15),
          ClipRRect(
            borderRadius: BorderRadius.circular(MySize.getHeight(15)),
            child: Container(
              height: MySize.getHeight(200),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(MySize.getHeight(15)),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CarouselSlider(
                    items: widget.propertyImages.map((e) {
                      return ClipRRect(
                        borderRadius:
                            BorderRadius.circular(MySize.getHeight(15)),
                        child: Container(
                          child: getImageByLink(
                            url: e.path.toString(),
                            height: MySize.getHeight(200),
                            width: MySize.getWidth(50),
                            boxFit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                        viewportFraction: 1,
                        enableInfiniteScroll: false,
                        onPageChanged: (index, _) {
                          currentIndexOfCard = index;
                          setState(() {});
                        }),
                  ),
                  if (widget.propertyImages.length > 1)
                    Positioned(
                        bottom: MySize.getHeight(20),
                        child: DotsIndicator(
                          dotsCount: widget.propertyImages.length,
                          position: double.parse(currentIndexOfCard.toString()),
                        )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
